using System;
using System.Collections.Generic;
using System.Data;

namespace DotNetFramework.pages
{
    public partial class AdminHome : System.Web.UI.Page
    {
        public string table = "";

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
            string addition;
            Dictionary<string, object> user;

            foreach (DataRow userRow in users)
            {
                user = ServerUser.GenerateDictionary(userRow);
                addition = (bool) user["isAdmin"] ? "class=\"bold\"" : "";

                table += $"<tr {addition}>\n";
                table += $"<td>{user["firstName"]} {user["lastName"]}</td>\n";

                foreach (var prop in user)
                    if (prop.Key != "isAdmin" && prop.Key != "firstName" && prop.Key != "lastName")
                        table += $"<td {(prop.Key == "gender" || prop.Key == "favoriteBrand" ? "class=\"capitalize\"" : "")}>" +
                            $"{(prop.Key == "isAdult" ? IsAdultCheckBox((bool) prop.Value) : prop.Value)}</td>\n";

                table += $"<td class=\"space-around\">{UpdateButton((string) user["email"])}" +
                    $"{((bool) user["isAdmin"] ? "" : DeleteButton((string) user["email"]))}</td>\n" +
                    $"</tr>\n";
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

        private string UpdateButton(string user) => $"<a href=\"UpdateUser.aspx?user={user}\" " +
                $"class=\"material-icons-outlined btn\">manage_accounts</a>";
        private string DeleteButton(string user) => $"<a href=\"DeleteUser.aspx?user={user}\" " +
                $"class=\"material-icons-outlined btn\">person_remove</a>";

        private string IsAdultCheckBox(bool isAdult) => $"<div style=\"display:flex; justify-content: center;\"><input type=\"checkbox\" {(isAdult ? "checked" : "")} disabled class=\"text-center\"/></div>";
        public string IsSelected(string key, string value) => Request.QueryString[key] == value ? "selected=\"selected\"" : "";
        public string IsChecked(string key, string value) => Request.QueryString[key] == value ? "checked" : "";
    }
}