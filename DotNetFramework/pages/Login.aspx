<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master"
    AutoEventWireup="true" CodeBehind="Login.aspx.cs"
    Inherits="DotNetFramework.pages.Login" %>

<%@ Import Namespace="DotNetFramework.utils" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../javascript/validation.js"></script>
    <link rel="stylesheet" href="../styles/login.css" />

    <title>Login</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScreen" runat="server">
    <div class="box">
        <div class="text-center text-header">התחברות</div>

        <div>
            עוד לא נרשמת?
      <a class="link underline-hover-effect" href="Register.aspx">הירשם כאן</a>.
        </div>
        <form
            class="login-form"
            method="post"
            id="MainForm"
            name="MainForm"
            onsubmit="return validateLogin()"
            onreset="resetErrors()"
            action="Login.aspx">
            <%=Components.TextInput("email", "דוא\"ל:", "en")%>
            <%=Components.TextInput("pswrd", "סיסמה:", type:"password")%>

            <div class="row submit-button-container">
                <span class="form-column">
                    <input
                        class="submit-button"
                        type="submit"
                        id="loginSubmitButton"
                        name="loginSubmitButton"
                        value="היכנס" />
                </span>
                <span class="form-column">
                    <input
                        class="submit-button"
                        type="reset"
                        id="reset"
                        name="reset"
                        value="אתחל" />
                </span>
            </div>
        </form>
    </div>
</asp:Content>
