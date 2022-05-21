using System;
using System.Collections.Generic;
using System.Linq;

namespace DotNetFramework.utils
{
    public class WebElement
    {
        // Static Values & Functions:
        public static string[] selfClosingTags =
            { "area","base","br","col","embed","hr","img","input","link","meta","param","source","track","wbr"};

        private static Exception selfClosingChildren = new Exception("Self-closing tag can't have children.");
        private static Exception classMustBeString = new Exception("Classes must be a string or a list of them.");
        private static Exception childrenNotStringOrElement = new Exception("Children can only be string or WebElements.");
        private static Exception stylesNotStringOrDict = new Exception("Styles must only be string or Dictionaries.");



        // Actual Element:
        private string tag;
        private string id;
        private List<string> classes;
        private Dictionary<string, string> styles;
        private List<object> children;
        private Dictionary<string, string> attributes;

        private bool isSelfClosed = false;

        public string ID => id;

        public WebElement(string tag, string id = null, object classes = null, object children = null,
            Dictionary<string, string> attributes = null, object styles = null)
        {
            this.tag = tag;
            this.id = id;
            this.attributes = attributes ?? new Dictionary<string, string>();
            isSelfClosed = selfClosingTags.Contains(tag);

            GenerateClasses(classes);
            GenerateChildren(children);
            GenerateStyles(styles);
        }

        private string Attributes => string.Join(" ", attributes.Select(kv => $"{kv.Key}{(kv.Value == "" ? "" : $"=\"{kv.Value}\"")}").ToArray());
        private string Styles => string.Join(" ", styles.Select(kv => $"{kv.Key}: {kv.Value};").ToArray());
        private string Classes => string.Join(" ", classes);

        public WebElement SetAttribute(string key, string value)
        {
            if (!string.IsNullOrEmpty(key) && !string.IsNullOrEmpty(value))
                attributes[key] = value;

            return this;
        }

        public WebElement AppendChild(object child)
        {
            children.Add(child);
            return this;
        }

        public WebElement AppendChildren(object[] moreChildren)
        {
            children.AddRange(moreChildren);
            return this;
        }

        public WebElement AppendChildren(List<object> moreChildren)
        {
            children.AddRange(moreChildren);
            return this;
        }

        public int CountChildren => children.Count;

        public WebElement AppendClass(string aClass) => AppendClass(aClass.Split(' ').ToList());
        public WebElement AppendClass(List<string> moreClasses)
        {
            classes.AddRange(moreClasses);
            return this;
        }
        public WebElement AppendClass(string[] moreClasses)
        {
            classes.AddRange(moreClasses);
            return this;
        }

        public WebElement AppendStyles(string style)
        {
            styles.AddRange(ConvertStyles(style));
            return this;
        }
        public WebElement AppendStyles(Dictionary<string, string> style)
        {
            styles.AddRange(style);
            return this;
        }

        public override string ToString()
        {
            if (id != null) attributes["id"] = id;
            if (classes.Count > 0) attributes["class"] = Classes;
            if (styles.Count > 0) attributes["style"] = Styles;

            return $"<{tag} {Attributes}{(isSelfClosed ? " /" : $">{string.Join("\n", children)}</{tag}")}>";
        }

        private void GenerateClasses(object classes) => this.classes = (classes == null ? new List<string>() :
                classes.GetType() == typeof(string) ? ((string) classes).Split().ToList() :
                classes.GetType() == typeof(List<string>) ? (List<string>) classes :
                throw classMustBeString);

        private void GenerateChildren(object children) => this.children = children == null ? new List<object>() :
                isSelfClosed ? throw selfClosingChildren :
                children.GetType() == typeof(WebElement) || children.GetType() == typeof(string) ? new List<object> { children } :
                children.GetType() == typeof(List<object>) ? (List<object>) children :
                throw childrenNotStringOrElement;

        private void GenerateStyles(object styles) => this.styles =
            styles == null ? new Dictionary<string, string>()
            : styles.GetType() == typeof(string) ? ConvertStyles((string) styles)
            : styles.GetType() == typeof(Dictionary<string, string>) ? (Dictionary<string, string>) styles
            : throw stylesNotStringOrDict;

        private Dictionary<string, string> ConvertStyles(string styles) => styles.Split(';')
            .Select(part => part.Split('=')).Where(part => part.Length == 2).ToDictionary(sp => sp[0], sp => sp[1]);
    }
}