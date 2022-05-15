<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master"
AutoEventWireup="true" CodeBehind="DoesItWorthIt.aspx.cs"
Inherits="DotNetFramework.pages.DoesItWorthIt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <link rel="stylesheet" href="/styles/article.css" />
  <title>האם זה שווה את זה</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScreen" runat="server">
  <article class="box article-parent">
    <section class="s1">
      <h1>האם זה שווה את זה?</h1>
    </section>
    <section class="s2">
      <h5>* מנוסח בלשון זכר אך פונה לכל המינים.</h5>
      <h2>תשובה קצרה: כן, אם יש לך כוח לזה</h2>
      <p>
        אם אתה לא אדם שלא מסתדר במיוחד עם טכנולוגיה, ולא מסתדר עם הוראות, ועם
        פתרון בעיות, זה כנראה לא בשבילך.<br />
        אבל, אם אתה טכנולוגי ומאמין באוטומציה, יש לך רצון ויכולת להשקיע בזה כסף,
        יכול מאוד להיות שזה בשבילך.
      </p>
      <p>
        הבית החכם נותן לך שליטה יותר רחבה על הבית שלך ביותר קלות. תוכל להחליף את
        הנורות בבית לחכמות, ולשלוט באור בבית שלך בכל מקום. למשל, תוכל לוודא
        שהאורות נכבים כשאתה מתרחק מהבית על ידי אוטומציות. אותו דבר עם המזגן/ים
        בבית.
      </p>
      <p>
        אז נכון, הבית ידרוש קצת יותר התעסקות. אבל אם יש לך רצון ואתה מוכן
        להתמודד עם זה, איכות החיים שלך תשתפר.
      </p>
    </section>

    <section class="s3">
      <img
        class="pic box"
        style="background-color: rgba(0, 0, 0, 0.16)"
        src="\assets\automation-1.png"
        alt="Couldn't load image :("
      />
    </section>
  </article>
</asp:Content>
