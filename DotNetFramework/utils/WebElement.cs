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
        private static Exception classMustBeString = new Exception("Classes must by a string or a list of them.");
        private static Exception childrenNotStringOrElement = new Exception("children can only be string or WebElements.");


        // Actual Element:
        private string tag;
        private string id;
        private List<string> classes;
        private Dictionary<string, string> styles;
        private List<object> children;
        private Dictionary<string, string> attributes;

        private bool isSelfClosed = false;

        public string ID => id;

        public WebElement(string tag, string id = null, object classes = null, object children = null, Dictionary<string, string> attributes = null, Dictionary<string, string> styles = null)
        {
            this.tag = tag;
            this.id = id;
            this.attributes = attributes ?? new Dictionary<string, string>();
            this.styles = styles ?? new Dictionary<string, string>();
            isSelfClosed = selfClosingTags.Contains(tag);

            this.classes = (classes == null ? new List<string>() :
                classes.GetType() == typeof(string) ? ((string) classes).Split().ToList() :
                classes.GetType() == typeof(List<string>) ? (List<string>) classes :
                throw classMustBeString);

            this.children = children == null ? new List<object>() :
                isSelfClosed ? throw selfClosingChildren :
                children.GetType() == typeof(WebElement) || children.GetType() == typeof(string) ? new List<object> { children } :
                children.GetType() == typeof(List<object>) ? (List<object>) children :
                throw childrenNotStringOrElement;
        }
        private string Attributes => string.Join(" ", attributes.Select(kv => $"{kv.Key}{(kv.Value == "" ? "" : $"=\"{kv.Value}\"")}").ToArray());
        private string Styles => string.Join(" ", styles.Select(kv => $"{kv.Key}: {kv.Value};").ToArray());
        private string Classes => string.Join(" ", classes);

        public void SetAttribute(string key, string value) => attributes[key] = value;
        public void AppendChild(object child) => children.Add(child);
        public int CountChildren => children.Count;

        public override string ToString()
        {
            if (id != null) attributes["id"] = id;
            if (classes.Count > 0) attributes["class"] = Classes;
            if (styles.Count > 0) attributes["style"] = Styles;

            return $"<{tag} {Attributes}{(isSelfClosed ? " /" : $">{string.Join("\n", children)}</{tag}")}>";
        }
    }
}