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
        public DataRowCollection users;
        public string[] fields = { "firstName","lastName","phone", "email","password", "isAdmin","gender","dueDate","favoriteBrand", "dscrptn"};

        private const string dbFileName = "Database.accdb", dbTableName = "table_users";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(bool)Session["isAdmin"])
            {
                Response.Redirect("~/pages/Home.aspx");
                return;
            }
                
            users = AdoHelper.ExecuteDataTable(dbFileName, $"SELECT * FROM {dbTableName}").Rows;
        }
    }
}