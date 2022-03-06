using DotNetFramework.utils;
using System;
using System.Collections.Generic;

namespace DotNetFramework.pages
{
    public partial class UpdateUser : System.Web.UI.Page
    {
        private const string dbFileName = "Database.accdb", dbTableName = "table_users";
        public Dictionary<string, object> userFromDB;
        public string email;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(bool) Session["isAdmin"])
            {
                Response.Redirect($"~/pages/Home.aspx");
                return;
            }

            email = Request.QueryString["user"];

            if (string.IsNullOrEmpty(email))
            {
                User404("");
                return;
            }

            userFromDB = GetUserFromDB();

            if (Request.Form["updateUserSubmitButton"] != null) HandleForm();
        }

        public void User404(string user) => Response.Redirect($"~/pages/AdminHome.aspx?code=404&user={user}");

        private void HandleForm()
        {
            var userFromForm = ServerUser.GenerateDictionary(Request.Form);
            userFromForm["email"] = email; // just in case
            userFromForm["isAdmin"] = userFromDB["isAdmin"];

            var compersion = ServerUser.Compare(userFromDB, userFromForm);
            if (compersion != null && compersion.Count != 0)
            {
                string values = ServerUser.UserToKeyValue(compersion);
                AdoHelper.DoQuery(dbFileName, $"UPDATE {dbTableName} SET {values} WHERE email = '{email}'");
            }

            Response.Redirect("~/pages/AdminHome.aspx");
        }

        private Dictionary<string, object> GetUserFromDB()
        {
            var user = AdoHelper.GetFirstRowObject(dbFileName,
               $"SELECT * FROM {dbTableName} WHERE email='{email}'");

            if (userFromDB == null) return ServerUser.GenerateDictionary(user);

            User404(email);
            return null;
        }
    }
}