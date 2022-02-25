﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DotNetFramework.pages
{
  public partial class Home : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
            if ((bool)Session["isAdmin"]) Response.Redirect("~/pages/AdminHome.aspx");
    }
  }
}