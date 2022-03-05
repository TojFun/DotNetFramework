using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;

namespace DotNetFramework.utils
{
    public class ServerUser
    {
        public static Dictionary<string, string> fields = new Dictionary<string, string> {
        { "firstName", "firstName" },
        { "lastName","lastName" },
        { "phone","phone" },
        { "email","email"},
        { "password","pswrd" },
        { "isAdmin","isAdmin" },
        { "isAdult","isAdult"},
        { "gender","gender" },
        { "dueDate","dueDate"},
        { "favoriteBrand","favoriteBrand" },
        { "description","dscrptn" }};

        public static Dictionary<string, object> GenerateDictionary(DataRow userDataRow) =>
            new Dictionary<string, object>
              {
                { "firstName",(string)userDataRow["firstName"] },
                {"lastName",(string)userDataRow["lastName"] },
                { "phone", (string)userDataRow["phone"] },
                { "email", (string)userDataRow["email"] },
                { "password", (string)userDataRow["pswrd"] },
                { "isAdult", (bool)userDataRow["isAdult"] },
                { "gender", (string)userDataRow["gender"] },
                { "dueDate", (DateTime)userDataRow["dueDate"] },
                { "favoriteBrand", (string)userDataRow["favoriteBrand"] },
                { "description", (string)userDataRow["dscrptn"] },
                { "isAdmin", (bool)userDataRow["isAdmin"] }
              };


        public static Dictionary<string, object> GenerateDictionary(NameValueCollection userData) =>
            new Dictionary<string, object>
            {
            { "firstName",userData["firstName"] },
            {"lastName",userData["lastName"] },
            { "phone", userData["phone"] },
            { "email", userData["email"] },
            { "password", userData["pswrd"] },
            { "isAdult", userData["isAdult"] !=null  },
            { "gender", userData["gender"] },
            { "dueDate", DateTime.Parse(userData["dueDate"]) },
            { "favoriteBrand", userData["favoriteBrand"] },
            { "description", userData["dscrptn"] },
            { "isAdmin", false }
            };

        public static Dictionary<string, object> Compare(Dictionary<string, object> oldUserInfo, Dictionary<string, object> newUserInfo)
        {
            if (oldUserInfo == null || newUserInfo == null) return null;

            var result = new Dictionary<string, object>();
            foreach (var pair in newUserInfo)
            {
                string key = pair.Key; object value = pair.Value;

                if (oldUserInfo.ContainsKey(key) && !value.Equals(oldUserInfo[key]))
                    result.Add(key, value);
            }

            return result;
        }

        public static string UserToKeyValue(Dictionary<string, object> user)
        {
            string str = "";

            foreach (var pair in user)
                str +=
                    $"{pair.Key} = { (pair.Value.GetType() == typeof(bool) ? pair.Value : $"'{pair.Value}'")},";

            return str.Remove(str.Length - 1);
        }
    }
}


