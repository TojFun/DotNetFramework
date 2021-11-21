<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Form.aspx.cs" Inherits="DotNetFramework.Form" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScreen" runat="server">
    <form action="/" method="post" id="MainForm" name="MainForm">
        <input type="text" id="username" name="username"/>
        <input type="password" id="password" name="password"/>
    </form>
</asp:Content>
