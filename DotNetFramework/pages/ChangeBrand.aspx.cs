using System;
using System.Web.UI;

namespace DotNetFramework.pages
{
    public partial class ChangeBrand : Page
    {
        private static readonly string[] brands = new string[] { "google", "amazon", "apple" };
        private const string dbFileName = "Database.accdb", dbTableName = "table_users";
        protected void Page_Load(object sender, EventArgs e)
        {
            string brand = Request.QueryString["brand"];
            bool isBrand = Array.IndexOf(brands, brand) > -1;

            var user = (WebsiteUser) Session["user"];

            if (isBrand && user != null)
            {
                AdoHelper.DoQuery(dbFileName, $"UPDATE {dbTableName} SET favoriteBrand = '{brand}' WHERE email = '{user.Email}'");
                user.FavoriteBrand = brand;
            }

            Response.Redirect($"../options/{(isBrand ? char.ToUpper(brand[0]) + brand.Substring(1) : "Google")}.aspx");

        }
    }
}