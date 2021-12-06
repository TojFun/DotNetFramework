<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master"
AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs"
Inherits="DotNetFramework.pages.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScreen" runat="server">
  <form action="mailto:ofek.jacobi@gmail.com" method="get">
    <div class="row">
      <span class="form-column hasLabel">
        <label for="email">כתובת דוא"ל:</label>
      </span>
      <span class="form-column hasTextInput">
        <input type="email" id="email" name="email" />
      </span>
    </div>

    <div class="row">
      <span class="form-column hasLabel">
        <label for="subject">נושא:</label>
      </span>
      <span class="form-column hasTextInput">
        <input type="text" id="subject" name="subject" />
      </span>
    </div>

    <div class="row">
      <span class="form-column hasLabel">
        <label for="body">תוכן:</label>
      </span>
      <span class="form-column hasTextInput">
        <textarea name="body" id="body" cols="120" rows="5"></textarea>
      </span>
    </div>

      <div class="row submit-button-container">
      <span class="form-column">
        <input
          class="submit-button"
          type="submit"
          id="submit"
          name="submit"
          value="שלח"
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
