using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DotNetFramework.pages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["loginSubmitButton"] == null) return;

            string dbFileName = "Database.accdb", dbTableName = "table_users";
            string email = Request.Form["email"], pswrd = Request.Form["pswrd"];

            DataTable users = AdoHelper.ExecuteDataTable(dbFileName, $"SELECT * FROM {dbTableName} WHERE email = '{email}' AND pswrd = '{pswrd}'");
            if (users.Rows.Count == 0) 
            {
                Response.Redirect("~/pages/Login.aspx?code=403");
                return;
            }

            DataRow user = users.Rows[0];

            Session["username"] = $"{user["firstName"]} {user["lastName"]}";
            Session["isAdmin"] = user["isAdmin"];

            Response.Redirect("~/pages/Home.aspx");
        }
    }
}