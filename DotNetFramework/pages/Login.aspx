<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DotNetFramework.pages.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../javascript/validation.js"></script>
  <link rel="stylesheet" href="../styles/login.css" />

    <title>Login</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScreen" runat="server">
    <form
    class="login-form"
    method="post"
    id="MainForm"
    name="MainForm"
    onsubmit="return validateLogin()"
    onreset="resetErrors()"
    action="Login.aspx"
  >
    <div class="row">
      <span class="form-column hasLabel">
        <label for="email" class="required">דוא"ל:</label>
      </span>
      <span class="form-column hasTextInput flex-column">
        <input
          lang="en"
          dir="ltr"
          class="en form-input"
          onkeyup="validate(this)"
          type="text"
          id="email"
          name="email"
        />
      </span>
    </div>

    <div class="row">
      <span class="form-column hasLabel">
        <label for="pswrd" class="required">סיסמה:</label>
      </span>
      <span class="form-column hasTextInput flex-column">
        <input
          onkeyup="validate(this)"
          type="password"
          id="pswrd"
          name="pswrd"
          class="form-input"
        />
      </span>
    </div>

    <div class="row submit-button-container">
      <span class="form-column">
        <input
          class="submit-button"
          type="submit"
          id="loginSubmitButton"
          name="loginSubmitButton"
          value="הכנס"
        />
      </span>
      <span class="form-column">
        <input
          class="submit-button"
          type="reset"
          id="reset"
          name="reset"
          value="אתחל"
        />
      </span>
    </div>
  </form>
</asp:Content>
