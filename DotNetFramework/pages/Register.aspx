<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master"
AutoEventWireup="true" CodeBehind="Register.aspx.cs"
Inherits="DotNetFramework.pages.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <script src="../javascript/validation.js"></script>
  <link rel="stylesheet" href="../styles/login.css" />

  <title>Registration</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainScreen" runat="server">
  <div class="box">
    <div class="text-center text-header">הירשמות</div>
    <div>
      כבר נרשמת?
      <a class="link underline-hover-effect" href="Login.aspx">התחבר</a>.
    </div>

    <form
      class="login-form"
      method="post"
      id="MainForm"
      name="MainForm"
      onsubmit="return validateRegistration()"
      onreset="resetErrors()"
      action="Register.aspx"
    >
      <div class="row">
        <span class="form-column hasLabel">
          <label for="firstName" class="required">שם פרטי:</label>
        </span>
        <span class="form-column hasTextInput flex-column">
          <input
            onkeyup="validate(this)"
            type="text"
            id="firstName"
            name="firstName"
            class="form-input"
          />
        </span>
      </div>

      <div class="row">
        <span class="form-column hasLabel">
          <label for="lastName" class="required">שם משפחה:</label>
        </span>
        <span class="form-column hasTextInput flex-column">
          <input
            onkeyup="validate(this)"
            type="text"
            id="lastName"
            name="lastName"
            class="form-input"
          />
        </span>
      </div>

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
          <label for="phone" class="required">מספר טלפון נייד:</label>
        </span>
        <span class="form-column hasTextInput flex-column">
          <input
            onkeyup="validate(this)"
            type="tel"
            id="phone"
            name="phone"
            class="form-input"
          />
        </span>
      </div>

      <div class="row">
        <span class="form-column hasLabel">
          <label for="dueDate" class="required">תאריך יעד:</label>
        </span>
        <span class="form-column hasTextInput flex-column">
          <input
            onkeyup="validate(this)"
            onchange="validate(this)"
            type="date"
            id="dueDate"
            name="dueDate"
            class="form-input"
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

      <div class="row">
        <span class="form-column hasLabel">
          <label for="favoriteBrand" class="required">מותג מועדף:</label>
        </span>
        <span lang="en" dir="ltr" class="form-column hasTextInput flex-column">
          <select
            class="en favoriteBrand"
            name="favoriteBrand"
            id="favoriteBrand"
          >
            <!--Brands: Google, Alexa (Amazon), Siri (Apple)-->
            <option value="google">Google</option>
            <option value="amazon">Alexa (Amazon)</option>
            <option value="apple">Siri (Apple)</option>
          </select>
        </span>
      </div>

      <div class="row">
        <span class="form-column hasLabel">
          <label for="dscrptn">תיאור:</label>
        </span>
        <span class="form-column hasTextInput flex-column">
          <textarea
            name="dscrptn"
            id="dscrptn"
            rows="5"
            class="form-input"
          ></textarea>
        </span>
      </div>

      <div class="row submit-button-container">
        <span class="form-column">
          <input
            class="submit-button"
            type="submit"
            id="registrationSubmitButton"
            name="registrationSubmitButton"
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
  </div>
</asp:Content>
