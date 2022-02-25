using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DotNetFramework.pages
{
    public partial class AdminHome : System.Web.UI.Page
    {
        private string[] fields = { "phone", "email", "pswrd", "isAdmin", "gender", "dueDate", "favoriteBrand", "dscrptn" };
        public string table = "";

        private const string dbFileName = "Database.accdb", dbTableName = "table_users";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(bool)Session["isAdmin"])
            {
                Response.Redirect("~/pages/Home.aspx");
                return;
            }

            GenerateTable(AdoHelper.ExecuteDataTable(dbFileName, $"SELECT * FROM {dbTableName}").Rows);
        }

        private void GenerateTable(DataRowCollection users)
        {
            string addition;
            const string updateIcon = "<a class=\"material-icons-outlined btn\">manage_accounts</a>";
            const string deleteIcon = "<a class=\"material-icons-outlined btn\">person_remove</a>";
           
            foreach (DataRow user in users)
            {
                addition = (bool)user["isAdmin"] ? "class=\"bold\"" : "";

                table += $"<tr {addition}>\n" +
                    $"<td>{user["firstName"]} {user["lastName"]}</td>";

                foreach (var field in fields)
                    table += $"<td>{user[field]}</td>\n";

                table += $"<td class=\"space-around\">{UpdateButton((string)user["email"])}" +
                    $"{DeleteButton((string)user["email"])}</td>\n" +
                    $"</tr>\n";
            }
        }

        private string UpdateButton(string user)
        {
            return $"<a href=\"UpdateUser.aspx?user={user}\" " +
                $"class=\"material-icons-outlined btn\">manage_accounts</a>";
        }
        private string DeleteButton(string user)
        {
            return $"<a href=\"DeleteUser.aspx?user={user}\" " +
                $"class=\"material-icons-outlined btn\">person_remove</a>";
        }
    }
}