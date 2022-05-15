using System;

namespace DotNetFramework.pages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["loginSubmitButton"] == null) return;

            string dbFileName = "Database.accdb", dbTableName = "table_users";
            string email = Request.Form["email"], pswrd = Request.Form["pswrd"];

            var user = AdoHelper.GetFirstRowObject(dbFileName, $"SELECT * FROM {dbTableName} WHERE email = '{email}' AND pswrd = '{pswrd}'");
            if (user == null)
            {
                Response.Redirect("~/pages/Login.aspx?code=403");
                return;
            }

            Session["user"] = new WebsiteUser(user);
            Session["username"] = ((WebsiteUser) Session["user"]).FullName;
            Session["isAdmin"] = user["isAdmin"];

            Response.Redirect("~/pages/Home.aspx");
        }
    }
}