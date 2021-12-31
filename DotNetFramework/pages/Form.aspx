<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master"
AutoEventWireup="true" CodeBehind="Form.aspx.cs"
Inherits="DotNetFramework.pages.Form" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <script src="../javascripts/validation.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScreen" runat="server">
  <form
    class="login-form"
    method="post"
    id="MainForm"
    name="MainForm"
    onsubmit="return validate()"
  >
    <!-- action="/" -->
    <div class="row">
      <span class="form-column hasLabel">
        <label for="firstName">שם פרטי:</label>
      </span>
      <span class="form-column hasTextInput flex-column">
        <input type="text" id="firstName" name="firstName" />
      </span>
    </div>

    <div class="row">
      <span class="form-column hasLabel">
        <label for="lastName">שם משפחה:</label>
      </span>
      <span class="form-column hasTextInput flex-column">
        <input type="text" id="lastName" name="lastName" />
      </span>
    </div>

    <div class="row">
      <span class="form-column">
        <label for="gender">מין:</label>
      </span>
      <span class="form-column">
        <input type="radio" id="male" name="gender" value="male" />
        <label for="male">זכר</label>
      </span>
      <span class="form-column">
        <input type="radio" id="female" name="gender" value="female" />
        <label for="female">נקבה</label>
      </span>
      <span class="form-column">
        <input checked type="radio" id="other" name="gender" value="other" />
        <label for="other">אחר</label>
      </span>

      <span class="form-column">
        <input type="checkbox" id="isAdult" name="isAdult" />
        <label for="isAdult">אני מעל גיל 18</label>
      </span>
    </div>

    <div class="row">
      <span class="form-column hasLabel">
        <label for="phone">מספר טלפון:</label>
      </span>
      <span class="form-column hasTextInput flex-column">
        <input type="tel" id="phone" name="phone" />
      </span>
    </div>

    <div class="row">
      <span class="form-column hasLabel">
        <label for="date">תאריך:</label>
      </span>
      <span class="form-column hasTextInput flex-column">
        <input type="date" id="date" name="date" />
      </span>
    </div>

    <div class="row">
      <span class="form-column hasLabel">
        <label for="password">סיסמה:</label>
      </span>
      <span class="form-column hasTextInput flex-column">
        <input type="password" id="password" name="password" />
      </span>
    </div>

    <div class="row">
      <span class="form-column hasLabel">
        <label for="description">תיאור:</label>
      </span>
      <span class="form-column hasTextInput flex-column">
        <textarea
          name="description"
          id="description"
          cols="120"
          rows="5"
        ></textarea>
      </span>
    </div>

    <div class="row submit-button-container">
      <span class="form-column">
        <input
          class="submit-button"
          type="submit"
          id="submit"
          name="submit"
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
          onclick="resetErrors()"
        />
      </span>
    </div>
  </form>
</asp:Content>
