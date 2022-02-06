using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DotNetFramework.pages
{
  public partial class Register : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      if (Request.Form["registrationSubmitButton"] == null) return;

      string dbFileName = "Database.accdb", dbTableName = "table_users";

      string firstName = Request.Form["firstName"], lastName = Request.Form["lastName"],
       email = Request.Form["email"], gender = Request.Form["gender"],
       phone = Request.Form["phone"],
       dueDate = Request.Form["dueDate"], pswrd = Request.Form["pswrd"],
       favoriteBrand = Request.Form["favoriteBrand"], dscrptn = Request.Form["dscrptn"];

      bool isAdult = Request.Form["isAdult"] == "isAdult";


      if (AdoHelper.DoesExist(dbFileName, $"SELECT * FROM {dbTableName} WHERE email = '{email}'"))
      {
        Response.Redirect("~/pages/Registration.aspx?code=409");
        return;
      }

      Session["username"] = email;

      string insert =
$@"INSERT INTO
  { dbTableName } (
    firstName,
    lastName,
    email,
    pswrd,
    phone,
    gender,
    isAdult,
    dueDate,
    favoriteBrand,
    dscrptn
  )
VALUES
  (
    '{firstName}',
    '{lastName}',
    '{email}',
    '{pswrd}',
    '{phone}',
    '{gender}',
    { isAdult },
    '{dueDate} 00:00:00',
    '{favoriteBrand}',
    '{dscrptn}'
  )";

      AdoHelper.DoQuery(dbFileName, insert);

                
        Session["username"] = firstName + " " + lastName;
      Response.Redirect("Home.aspx");
    }
  }
}