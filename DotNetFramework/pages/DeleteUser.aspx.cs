using System;

namespace DotNetFramework.pages
{
    public partial class DeleteUser : System.Web.UI.Page
    {
        private const string dbFileName = "Database.accdb", dbTableName = "table_users";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(bool) Session["isAdmin"])
            {
                Response.Redirect($"~/pages/Home.aspx");
                return;
            }

            string email = Request.QueryString["user"];

            if (string.IsNullOrEmpty(email))
            {
                Response.Redirect($"~/pages/AdminHome.aspx?code=404&user={email}");
                return;
            }

            AdoHelper.DoQuery(dbFileName, $"DELETE FROM {dbTableName} WHERE email='{email}'");
            Response.Redirect($"~/pages/AdminHome.aspx?code=200");
        }
    }
}