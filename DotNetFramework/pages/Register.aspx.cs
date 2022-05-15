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

            var user = new WebsiteUser(Request.Form);

            Insert(user.Dict);

            Session["user"] = user;
            Session["username"] = user.FullName;
            Response.Redirect("Home.aspx");
        }

        public void Insert(Dictionary<string, object> user)
        {
            string insert = $"INSERT INTO { dbTableName } (";
            foreach (var keyValuePair in user)
                insert += $"{(keyValuePair.Key == "firstName" ? "" : ",")} {WebsiteUser.fields[keyValuePair.Key]}";

            insert += $") VALUES (";

            foreach (var keyValuePair in user)
            {
                object value = keyValuePair.Value;
                insert += $"{(keyValuePair.Key == "firstName" ? "" : ",")} { (value.GetType() == typeof(bool) ? value : $"'{value.ToString().Replace("'", "＇")}'")}";
            }

            insert += ")";

            AdoHelper.DoQuery(dbFileName, insert);
        }
    }
}