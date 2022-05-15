<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master"
    AutoEventWireup="true" CodeBehind="Register.aspx.cs"
    Inherits="DotNetFramework.pages.Register" %>

<%@ Import Namespace="DotNetFramework.utils" %>

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
            action="Register.aspx">
            <%=Components.TextInput("firstName", "שם פרטי:")%>

            <%=Components.TextInput("lastName", "שם משפחה:")%>

            <%=Components.TextInput("email", "דוא\"ל:", "en")%>

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

            <%=Components.TextInput("phone", "מספר טלפון נייד:", type:"tel")%>
            <%=Components.TextInput("dueDate", "תאריך יעד:", type:"date")%>
            <%=Components.TextInput("pswrd", "סיסמה:", type:"password")%>

            <div class="row">
                <span class="form-column hasLabel">
                    <label for="favoriteBrand" class="required">מותג מועדף:</label>
                </span>
                <span lang="en" dir="ltr" class="form-column hasTextInput flex-column">
                    <select
                        class="en favoriteBrand"
                        name="favoriteBrand"
                        id="favoriteBrand">
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
                        class="form-input"></textarea>
                </span>
            </div>

            <div class="row submit-button-container">
                <span class="form-column">
                    <input
                        class="submit-button"
                        type="submit"
                        id="registrationSubmitButton"
                        name="registrationSubmitButton"
                        value="הירשם" />
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

    <%if ((string)Request.QueryString["code"] == "409")
        { %>
    <%=new ErrorMessage("User Exists", "A user with this email adress already exists in the system.", "Try Again", "Login.aspx") %>
    <%} %>
</asp:Content>
