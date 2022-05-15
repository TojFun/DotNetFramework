using System;

namespace DotNetFramework.pages
{
    public partial class UpdateUser : System.Web.UI.Page
    {
        private const string dbFileName = "Database.accdb", dbTableName = "table_users";
        public WebsiteUser userFromDB;
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

        public void User404(string user) => Response.Redirect($"~/admin/Home.aspx?code=404&user={user}");

        private void HandleForm()
        {
            var userFromForm = new WebsiteUser(Request.Form)
            {
                Email = email, // just in case
                IsAdmin = userFromDB.IsAdmin
            };

            var compersion = userFromDB.CompareTo(userFromForm);
            if (compersion != null && compersion.Count != 0)
            {
                string values = WebsiteUser.UserToKeyValue(compersion);
                AdoHelper.DoQuery(dbFileName, $"UPDATE {dbTableName} SET {values} WHERE email = '{email}'");
            }

            Response.Redirect("~/admin/Home.aspx?code=200&msg=Successfully+Updated");
        }

        private WebsiteUser GetUserFromDB()
        {
            var user = AdoHelper.GetFirstRowObject(dbFileName,
               $"SELECT * FROM {dbTableName} WHERE email='{email}'");

            if (userFromDB == null) return new WebsiteUser(user);

            User404(email);
            return null;
        }
    }
}