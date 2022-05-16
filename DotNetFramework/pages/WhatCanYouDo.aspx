<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master"
    AutoEventWireup="true" CodeBehind="WhatCanYouDo.aspx.cs"
    Inherits="DotNetFramework.pages.WebForm2" %>

<%@ Import Namespace="DotNetFramework.utils" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>מה זה נותן לי</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScreen" runat="server">
    <article class="box article-parent">
        <section class="s1">
            <h1>מה עושים עם זה?</h1>
        </section>
        <section class="s2">
            <h5>* מנוסח בלשון זכר אך פונה לכל המינים.</h5>
            <div>
                <h2>בגדול:</h2>
                <%= new OrderedList(new string[]{ "לשלוט בבית מכל מקום", "לחסוך בחשמל", "לשלוט בבית מהמיטה", "ליצור אוטומציות"}) %>
            </div>

            <div>
                <h3>לדוגמה:</h3>
                <%= new OrderedList(new string[]{ 
    "כל הבוקר כשאתה מתעורר, הבית יעיר אותך, ידליק את האור, ישמיע מוזיקה, ישמיע את החדשות או כל דבר אחד",
    "כל פעם שאתה עוזב את הבית, הבית יוודא שהכל כבוי",
    "כשמגיע משהו לבית כשאתה לא נמצא, תוכל לראות, לתקשר איתו ואפילו לפתוח לו מרחוק"
                }) %>
            </div>
        </section>

        <section class="s3">
            <img class="box pic" src="\assets\Image-via-Shutterstock.com_.jpg" alt="Couldn't load image :(" />
        </section>
    </article>
</asp:Content>
