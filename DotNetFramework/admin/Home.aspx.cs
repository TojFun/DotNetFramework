using DotNetFramework.utils;
using System;
using System.Collections.Generic;
using System.Data;

namespace DotNetFramework.pages
{
    public partial class AdminHome : System.Web.UI.Page
    {
        public WebElement table = new WebElement("tbody");

        private const string dbFileName = "Database.accdb", dbTableName = "table_users";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(bool) Session["isAdmin"])
            {
                Response.Redirect("~/pages/Home.aspx");
                return;
            }

            string query = GetQuery();

            GenerateTable(AdoHelper.ExecuteDataTable(dbFileName, query).Rows);
        }

        private void GenerateTable(DataRowCollection users)
        {
            WebsiteUser user;

            foreach (DataRow userRow in users)
            {
                user = new WebsiteUser(userRow);
                var columns = new List<object> { new WebElement("td", children: new List<object> { user.FirstName, user.LastName }) };

                foreach (var prop in user.Dict)
                {
                    if (prop.Key != "isAdmin" && prop.Key != "firstName" && prop.Key != "lastName")
                    {
                        columns.Add(new WebElement("td",
                            classes: prop.Key == "gender" || prop.Key == "favoriteBrand" ? "capitalize" : null,
                            children: new List<object> { prop.Key == "isAdult" ? Components.IsAdultCheckBox((bool) prop.Value) : prop.Value }
                            ));
                    }
                }

                columns.Add(new WebElement("td",
                    classes: "space-around",
                    children: new List<object> {
                        Components.UpdateButton( user.Email),
                        { Components.DeleteButton( user.Email), ! user.IsAdmin }
                    }));

                table.AppendChild(new WebElement("tr", classes: user.IsAdmin ? "bold" : null, children: columns));
            }
        }


        private string GetQuery()
        {
            string query = $"SELECT * FROM {dbTableName}",
                favoriteBrand = Request.QueryString["favoriteBrand"] == "all" ?
                null : Request.QueryString["favoriteBrand"],
                gender = Request.QueryString["gender"];

            if (favoriteBrand == null && gender == null) return query;
            query += " WHERE";

            if (gender != null && favoriteBrand != null)
                return query + $" favoriteBrand = '{favoriteBrand}' AND gender = '{gender}'";

            if (favoriteBrand != null) return query + $" favoriteBrand = '{favoriteBrand}'";

            return query + $" gender = '{gender}'";
        }

        //$"<div style=\"display:flex; justify-content: center;\"><input type=\"checkbox\" {(isAdult ? "checked" : "")} disabled class=\"text-center\"/></div>";
        public string IsSelected(string key, string value) => Request.QueryString[key] == value ? "selected=\"selected\"" : "";
        public string IsChecked(string key, string value) => Request.QueryString[key] == value ? "checked" : "";
    }
}