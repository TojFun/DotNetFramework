<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="UpdateUser.aspx.cs" Inherits="DotNetFramework.pages.UpdateUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../javascript/validation.js"></script>
    <link rel="stylesheet" href="../styles/login.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainScreen" runat="server">
    <div class="box">
        <form
            class="login-form"
            method="post"
            id="UpdateForm"
            name="UpdateForm"
            onsubmit="return validateRegistration()"
            onreset="resetErrors()"
            action="UpdateUser.aspx?user=<%=email %>">
            <div class="row form-column">
                <span class="hasLabel ">דוא"ל: </span>
                <span lang="en" dir="ltr" class="hasTextInput text-space bold larger" id="email"><%=userFromDB.Email%></span>
            </div>

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
                        value="<%=userFromDB.FirstName%>" />
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
                        value="<%=userFromDB.LastName%>" />
                </span>
            </div>

            <div class="row">
                <span class="form-column">
                    <label for="gender">מין:</label>
                </span>
                <span class="form-column">
                    <input type="radio" id="male" name="gender" value="male" <%=userFromDB.Gender == "male"? "checked" : ""%> />
                    <label for="male">זכר</label>
                </span>
                <span class="form-column">
                    <input type="radio" id="female" name="gender" value="female" <%=userFromDB.Gender == "female"? "checked" : ""%> />
                    <label for="female">נקבה</label>
                </span>
                <span class="form-column">
                    <input type="radio" id="other" name="gender" value="other" <%=userFromDB.Gender == "other" ? "checked" : ""%> />
                    <label for="other">אחר</label>
                </span>

                <span class="form-column">
                    <input type="checkbox" id="isAdult" name="isAdult" <%=userFromDB.IsAdult ? "checked" : ""%> />
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
                        value="<%=userFromDB.Phone%>" />
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
                        value="<%=userFromDB.DueDate.ToString("yyyy-MM-dd")%>" />
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
                        value="<%=userFromDB.Password%>" />
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
                        id="favoriteBrand">
                        <!--Brands: Google, Alexa (Amazon), Siri (Apple)-->
                        <option value="google" <%=userFromDB.FavoriteBrand == "google" ? "selected=\"selected\"" : ""%>>Google</option>
                        <option value="amazon" <%=userFromDB.FavoriteBrand == "amazon" ? "selected=\"selected\"" : ""%>>Alexa (Amazon)</option>
                        <option value="apple" <%=userFromDB.FavoriteBrand == "apple" ? "selected=\"selected\"" : ""%>>Siri (Apple)</option>
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
                        class="form-input"><%=userFromDB.Description%></textarea>
                </span>
            </div>

            <div class="row submit-button-container">
                <span class="form-column">
                    <input
                        class="submit-button"
                        type="submit"
                        id="updateUserSubmitButton"
                        name="updateUserSubmitButton"
                        value="עדכן" />
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
