<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="DotNetFramework.pages.AdminHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined"
      rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScreen" runat="server">
    <div>
        <form action="/" method="get">
        </form>
    </div>

    <div>
        <h2>משתמשי האתר:</h2>
        <%if (table.Length > 0) {  %>
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
            <tbody>
                <%=table %>
            </tbody>
        </table>
        <%} %>
    </div>
</asp:Content>
