using System;

namespace DotNetFramework.pages
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((bool) Session["isAdmin"]) Response.Redirect("~/pages/AdminHome.aspx");
        }
    }
}