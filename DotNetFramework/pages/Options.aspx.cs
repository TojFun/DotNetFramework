using System;

namespace DotNetFramework.pages
{
    public partial class Options : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var user = (WebsiteUser) Session["user"];

            if (user == null)
            {
                Response.Redirect("~/options/Google.aspx");
                return;
            }

            switch (user.FavoriteBrand)
            {
                case "Apple":
                    Response.Redirect("~/options/Apple.aspx");
                    break;
                case "Amazon":
                    Response.Redirect("~/options/Amazon.aspx");
                    break;
                default:
                    Response.Redirect("~/options/Google.aspx");
                    break;
            }
        }
    }
}