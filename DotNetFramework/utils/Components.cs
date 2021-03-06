using System;
using System.Collections.Generic;

namespace DotNetFramework.utils
{

    public static class Extensions
    {
        public static void Add<TKey, TValue>(this Dictionary<TKey, TValue> dict, TKey key, TValue value, bool condition = true)
        {
            if (condition)
                dict.Add(key, value);
        }

        public static void Add<T>(this List<T> list, T value, bool condition = true)
        {
            if (condition)
                list.Add(value);
        }

        public static void AddRange<T, S>(this Dictionary<T, S> source, Dictionary<T, S> collection)
        {
            if (collection == null)
            {
                throw new ArgumentNullException("Collection is null");
            }

            foreach (var item in collection)
            {
                if (!source.ContainsKey(item.Key))
                    source.Add(item.Key, item.Value);

                else source[item.Key] = item.Value;
            }
        }
    }

    public class Script : WebElement
    {
        public Script(string js) :
            base("script", children: js)
        { }
    }

    public class ImageLink : WebElement
    {
        public static int counter = 0;
        private string id;

        public ImageLink(string src, string link, string discription, object classes = null)
            : base("div", $"imglink{counter}", classes)
        {
            AppendClass("imglink-div clickable box preload");

            AppendChildren(new WebElement[] {
                new WebElement("img", classes: "imglink-pic box",
                attributes: new Dictionary<string, string> {
                   { "onclick" , $"window.location.href='{link}'"},
                   { "src", src },
                   { "alt","Couldn't load image :(" }
               }),
                new WebElement("div", classes: "imglink-content", children:discription)
            });

            id = $"imglink{counter}";
            counter++;

            AppendChild(new Script(
                $"const {id} = document.querySelector('#{id}');" +
                "setTimeout(() => {" +
                $"   {id}.classList.remove('preload');" +
                "}, 500);"
            ));
        }
    }

    public class Link : WebElement
    {
        public Link(object children, string link, string id = null, string classes = null)
            : base("a", id, "link underline-hover-effect", children,
                new Dictionary<string, string> { { "href", link } },
                new Dictionary<string, string> { { "font-weight", "bold" } }
            )
        { if (classes != null) AppendClass(classes); }
    }

    public class WikiLink : Link
    {
        private static int counter = 0;
        public WikiLink(string text, string link = null) :
            base(text, $"https://en.wikipedia.org/wiki/{(link == null ? text : link)}", $"wikilink{counter}") => counter++;
    }
    public class ErrorMessage : WebElement
    {
        public ErrorMessage(string title, string content, string buttonText, string refreshLink, object classes = null, Dictionary<string, string> styles = null)
            : base("div")
        {
            var div = new WebElement("div", "error-message", classes, styles: styles, children: new List<object> {
                    new WebElement("h1", id:"error-title", children:title),
                    new WebElement("h4", id:"error-text", children:content),
                    new LinkButton(refreshLink, id:"error-btn", children:buttonText )
                });

            div.AppendClass(new List<string> { "box", "error-message" });

            AppendChildren(new List<object> { new WebElement("div", classes: "overlay", children: div) });
        }
    }

    public class Article : WebElement
    {
        private int sectionsCount = 0;
        public Article(string id, object classes = null, object children = null,
            Dictionary<string, string> attributes = null, Dictionary<string, string> styles = null) :
            base("article", id, classes, children, attributes, styles)
        { }

        public void AddSection(string id = null, object classes = null, object children = null,
            Dictionary<string, string> attributes = null, Dictionary<string, string> styles = null)
        {
            sectionsCount++;
            AppendChild(new WebElement("section", id ?? $"{ID}-section-{sectionsCount}", classes, children, attributes, styles));
        }
    }

    public class OrderedList : WebElement
    {
        private static int count = 1;
        public OrderedList(string[] children, Dictionary<string, string> childStyle = null) :
            base("ol", $"ol{count}")
        {

            count++;
            foreach (string child in children)
            {
                AppendChild(new WebElement("li", children: $"{child}.", styles: childStyle));
            }
        }
    }

    public class Components
    {
        public static LinkButton UpdateButton(string user) => new LinkButton(
            $"UpdateUser.aspx?user={user}",
            classes: "material-icons-outlined",
            children: "manage_accounts"
            );

        public static LinkButton DeleteButton(string user) => new LinkButton(
            $"DeleteUser.aspx?user={user}",
           classes: "material-icons-outlined",
           children: "person_remove"
           );

        public static WebElement IsAdultCheckBox(bool isAdult) => new WebElement("div",
           styles: new Dictionary<string, string> { { "display", "flex" }, { "justify-content", "center" } },
           children: new List<object> { new WebElement( "input",
                attributes: new Dictionary<string, string> { { "type", "checkbox" },  { "checked", "", isAdult } , { "disabled", ""} },
                classes: new List<string> { "text-center" }
                ) }
           );

        public static WebElement TextInput(string id, string label, string lang = "he", string type = "text", string value = null, bool textarea = false, bool toValidate = true)
            => new WebElement("div",
            classes: "row",
            children: new List<object> {
                new WebElement("span", classes: "form-column hasLabel",
                    children:
                    new WebElement("label", classes: "required",
                        attributes: new Dictionary<string, string> { { "for", id } },
                        children: label
                        )
                    ),
                new WebElement("span", classes: "form-column hasTextInput flex-column",
                    children: new WebElement(textarea ? "textarea" : "input", id: id, classes:"form-input",
                        children:textarea ? value : null,
                        attributes: new Dictionary<string, string> {
                            {"onkeyup", toValidate ? "validate(this)" : "" },
                            {"type",type }, {"name", id},
                            {"lang",lang },
                            { "dir",lang == "he" ? "rtl":"ltr"},
                            {"value", value, value != null && !textarea}
                        }))
            });
    }

    public class LinkButton : WebElement
    {
        public LinkButton(string link, string id = null, object classes = null, object children = null, Dictionary<string, string> attributes = null, Dictionary<string, string> styles = null) :
            base("a", id, classes, children, new Dictionary<string, string> { { "href", link } }, styles) => AppendClass(new List<string> { "btn", "inherit-color" });
    }

}