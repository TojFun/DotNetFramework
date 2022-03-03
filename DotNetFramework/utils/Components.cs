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
    }

    public class Components
    {
        public static WebElement UpdateButton(string user) => new WebElement("a",
            classes: "material-icons-outlined btn",
            attributes: new Dictionary<string, string> { { "href", $"UpdateUser.aspx?user={user}" } },
            children: new List<object> { "manage_accounts" }
            );

        public static WebElement DeleteButton(string user) => new WebElement("a",
           classes: "material-icons-outlined btn",
           attributes: new Dictionary<string, string> { { "href", $"DeleteUser.aspx?user={user}" } },
           children: new List<object> { "person_remove" }
           );

        public static WebElement IsAdultCheckBox(bool isAdult) => new WebElement("div",
           styles: new Dictionary<string, string> { { "display", "flex" }, { "justify-content", "center" } },
           children: new List<object> { new WebElement( "input",
                attributes: new Dictionary<string, string> { { "type", "checkbox" },  { "checked", "", isAdult } , { "disabled", ""} },
                classes: new List<string> { "text-center" }
                ) }
           );

        public static WebElement TextInput(string id, string label, string lang = "he", string type = "text", string value = null) => new WebElement("div",
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
                    children: new WebElement("input", id: id, classes:"form-input",
                        attributes: new Dictionary<string, string>{
                            {"onkeyup", "validate(this)" },
                            {"type",type }, {"name", id},
                            {"lang",lang },
                            { "dir",lang == "he" ? "rtl":"ltr"},
                            {"value", value, value != null}
                        }))
            });
    }
}