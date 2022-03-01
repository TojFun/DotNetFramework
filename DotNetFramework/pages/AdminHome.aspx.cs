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

            GenerateTable(AdoHelper.ExecuteDataTable(dbFileName, $"SELECT * FROM {dbTableName}").Rows);
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
                        table += $"<td>{prop.Value}</td>\n";

                table += $"<td class=\"space-around\">{UpdateButton((string) user["email"])}" +
                    $"{DeleteButton((string) user["email"])}</td>\n" +
                    $"</tr>\n";
            }
        }

        private string UpdateButton(string user) => $"<a href=\"UpdateUser.aspx?user={user}\" " +
                $"class=\"material-icons-outlined btn\">manage_accounts</a>";
        private string DeleteButton(string user) => $"<a href=\"DeleteUser.aspx?user={user}\" " +
                $"class=\"material-icons-outlined btn\">person_remove</a>";
    }
}