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
            var userRow = AdoHelper.GetFirstRowObject(dbFileName, $"SELECT * FROM {dbTableName} WHERE email='{email}'");

            if (string.IsNullOrEmpty(email) || userRow == null)
            {
                Response.Redirect($"~/admin/Home.aspx?code=404&user={email}");
                return;
            }

            bool isAdmin = (new WebsiteUser(userRow)).IsAdmin;

            if (isAdmin)
            {
                Response.Redirect($"~/admin/Home.aspx?code=403&user={email}");
                return;
            }

            AdoHelper.DoQuery(dbFileName, $"DELETE FROM {dbTableName} WHERE email='{email}'");
            Response.Redirect($"~/admin/Home.aspx?code=200&msg=Successful+Delete");
        }
    }
}