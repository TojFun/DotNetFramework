using DotNetFramework.utils;
using System;
using System.Collections.Generic;
using System.Web.UI;

namespace DotNetFramework.pages
{
    public partial class Register : Page
    {
        private const string dbFileName = "Database.accdb", dbTableName = "table_users";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["registrationSubmitButton"] == null) return;

            if (AdoHelper.DoesExist(dbFileName, $"SELECT * FROM {dbTableName} WHERE email = '{Request.Form["email"]}'"))
            {
                Response.Redirect("~/pages/Register.aspx?code=409");
                return;
            }

            var user = ServerUser.GenerateDictionary(Request.Form);

            Insert(user);

            //Session["user"] = user;
            Session["username"] = $"{user["firstName"]} {user["lastName"]}";
            Response.Redirect("Home.aspx");
        }

        public void Insert(Dictionary<string, object> user)
        {
            string insert = $"INSERT INTO { dbTableName } (";
            foreach (var keyValuePair in user)
                insert += $"{(keyValuePair.Key == "firstName" ? "" : ",")} {ServerUser.fields[keyValuePair.Key]}";

            insert += $") VALUES (";

            foreach (var keyValuePair in user)
            {
                object value = keyValuePair.Value;
                insert += $"{(keyValuePair.Key == "firstName" ? "" : ",")} { (value.GetType() == typeof(bool) ? value : $"'{value}'")}";
            }

            insert += ")";

            AdoHelper.DoQuery(dbFileName, insert);
        }
    }
}