<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="DotNetFramework.pages.AdminHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScreen" runat="server">
    <div>
        <form action="/" method="get">

        </form>
    </div>

    <div>
        <table border="1" style="width:100%;">
            <thead>
                <tr>
                    <th>שם פרטי</th>
                    <th>שם משפחה</th>
                    <th>טלפון</th>
                    <th>אימייל</th>
                    <th>סיסמה</th>
                    <th>מבוגר?</th>
                    <th>מין</th>
                    <th>תאריך יעד</th>
                    <th>מותג מועדף</th>
                    <th>תיאור</th>
                </tr>
            </thead>
            <tbody>
                <%
                    foreach (var user in users)
                    {
                        foreach (var field in fields)
                        {
                            user[field];
                        %>

                   <% }} %>
                <tr>
                    
                </tr>
            </tbody>
        </table>
    </div>
</asp:Content>
