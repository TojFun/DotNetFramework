using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DotNetFramework.pages
{
  public partial class Registration : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      System.Console.WriteLine("Hello World!");
      if (Request.Form["registrationSubmitButton"] == null) return;

      string dbFileName = "Database.accdb", dbTableName = "table_users";

      string firstName = Request.Form["firstName"], lastName = Request.Form["lastName"],
       email = Request.Form["email"], gender = Request.Form["gender"],
       isAdult = Request.Form["isAdult"], phone = Request.Form["phone"],
       dateTime = Request.Form["dateTime"], password = Request.Form["password"],
       favoriteBrand = Request.Form["favoriteBrand"], description = Request.Form["description"];

      Session["username"] = email;

      if (AdoHelper.IsExist(dbFileName, $"SELECT * FROM {dbTableName} WHERE email = '{email}'"))
      {
        Response.Redirect("~/pages/Form.aspx?code=409");
        return;
      }

      string insert =
$@"INSERT INTO {dbTableName} (firstName, lastName, email, password, phone, gender, isAdult, dateTime, favoriteBrand, description) 
VALUES ('{firstName}', '{lastName}', '{email}', '{password}', '{phone}','{gender}', '{isAdult}', '{dateTime}', '{favoriteBrand}', '{description}')";

      AdoHelper.DoQuery(dbFileName, insert);

      Response.Redirect("HomePage.aspx");
    }
  }
}