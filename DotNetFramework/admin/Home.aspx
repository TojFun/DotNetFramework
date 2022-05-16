<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="DotNetFramework.pages.AdminHome" %>

<%@ Import Namespace="DotNetFramework.utils" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined"
        rel="stylesheet">

    <link rel="stylesheet" href="../styles/admin.css" />
    <script>
        const change = () => document.querySelector("#search-form")?.submit()
    </script>

    <title>מנהל - דף הבית</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScreen" runat="server">
    <form action="Home.aspx" method="get" id="search-form">
        <div class=" box margin-bottom search">
            <div class="larger search-bar-column title" style="margin-bottom: 0.5em;">סינון חיפוש:</div>
            <div class="bar">
                <span class="search-bar-column">
                    <span class="form-column bold">
                        <label for="favoriteBrand ">מותג מועדף:</label>
                    </span>
                    <span lang="en" dir="ltr">
                        <select
                            class="en favoriteBrand"
                            name="favoriteBrand"
                            id="favoriteBrand" onchange="change()">
                            <!--Brands: Google, Alexa (Amazon), Siri (Apple)-->
                            <option value="all" <%=IsSelected("favoriteBrand", "all" )%>>All</option>
                            <option value="google" <%=IsSelected("favoriteBrand", "google" )%>>Google</option>
                            <option value="amazon" <%=IsSelected("favoriteBrand", "amazon" )%>>Alexa (Amazon)</option>
                            <option value="apple" <%=IsSelected("favoriteBrand", "apple" )%>>Siri (Apple)</option>
                        </select>
                    </span>
                </span>

                <span class=" search-bar-column">
                    <span class="form-column bold">
                        <label for="gender">מין:</label>
                    </span>
                    <span class="form-column">
                        <input <%=IsChecked("gender", "male" )%> type="radio" id="male" name="gender" value="male" onchange="change()" />
                        <label for="male">זכר</label>
                    </span>
                    <span class="form-column">
                        <input <%=IsChecked("gender", "female" )%> type="radio" id="female" name="gender" value="female" onchange="change()" />
                        <label for="female">נקבה</label>
                    </span>
                    <span class="form-column">
                        <input <%=IsChecked("gender", "other" )%> type="radio" id="other" name="gender" value="other" onchange="change()" />
                        <label for="other">אחר</label>
                    </span>
                </span>
            </div>

            <div class="actions">
                <a href="Home.aspx" id="reset-btn" name="reset-btn" class="btn colorful-btn align-center">אתחל</a>
            </div>
        </div>
    </form>

    <div>
        <h2>משתמשי האתר:</h2>
        <%if (table.CountChildren > 0)
            {  %>
        <table border="1" style="width: 100%;">
            <thead>
                <tr>
                    <th>שם</th>
                    <th>טלפון</th>
                    <th>אימייל</th>
                    <th>סיסמה</th>
                    <th>מבוגר?</th>
                    <th>מין</th>
                    <th>תאריך יעד</th>
                    <th>מותג מועדף</th>
                    <th>תיאור</th>
                    <th>פעולות</th>
                </tr>
            </thead>
            <%=table %>
        </table>
        <%} %>
    </div>

    <%if ((string) Request.QueryString["code"] == "404")
        { %>
    <%=new ErrorMessage("User could not be found", $"The user {(string)Request.QueryString["user"]} could not be found.", "Return to Home", "Home.aspx") %>
    <%}
        else if ((string) Request.QueryString["code"] == "403")
        { %>
    <%=new ErrorMessage("Forbidden", $"The user {(string)Request.QueryString["user"]} cannot be deleted.", "Return to Home", "Home.aspx") %>
    <%}
        else if ((string) Request.QueryString["code"] == "200")
        { %>
    <%=new ErrorMessage((string)Request.QueryString["msg"], "", "Return to Home", "Home.aspx") %>
    <%} %>
</asp:Content>
