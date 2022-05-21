<%@ Page Title="" Language="C#" MasterPageFile="~/options/Options.master"
AutoEventWireup="true" CodeBehind="Amazon.aspx.cs"
Inherits="DotNetFramework.pages.WebForm4" %> <%@ Import
Namespace="DotNetFramework.utils" %>

<asp:Content ID="Content1" ContentPlaceHolderID="OptionsScreen" runat="server">
  <section class="s1">
    <h1>Amazon - Alexa</h1>
  </section>
  <section class="s2">
    <p class="f-p">
      <%=new WikiLink("Alexa", "Amazon_Alexa")%> היא מוצר הדגל של Amazon. Alexa
      היא העוזרת הוירטואלית של אמזון, והיא המנהלת של הבית החכם של Amazon.
      האפליקציה של Alexa מאפשרת שליטה על כל הבית.
    </p>
    <p>
      התמיכה בAlexa מצד מוצרי צד שלישי הופכים אותה לבחירה של רבים. Amazon עצמם
      לא מייצרים כלום מלבד <%=new WikiLink("Hubs", "Smart_home_hub")%>, כמו ה
      <%=new WikiLink("Echo Dot", "Amazon_Echo")%> למשל, שהם מכשירים שמפזרים
      בבית כדי לתקשר עם Alexa. לאחרונה החלו לייצר גם Hubs עם מסך, שמאפשרים שליטה
      נוספת על ידי שימוש במסך.
    </p>
    <p>
      לAlexa יש Skills, שהם כמו אפליקציות שניתן להוריד באפליקציה שלה, והם נותנים
      לAlexa יכולות נוספות שיצרו צד שלישי. Skills מאפשרים חיבור למגוון רחב של
      שירותים ודרכם מוצרי בית חכם צד שלישי נכנסים לבית. הSkills הם היתרון המרכזי
      של Amazon על המתחרות, והם מאפשרים לכל אחד להציע את מוצריו בשוק של Alexa.
    </p>
    <p>
      Alexa נפוצה מאוד בארצות הברית ורוב הבתים בוחרים בה, בעיקר בזכות התמיכה
      הרחבה. המחירים של Amazon זולים יותר משל שתי המתחרות. בנוסף, בעיקר לשוק
      האמריקאי, Amazon היא פלטפורמה נגישה מאוד, ומוצרים מגיעים מאוד מהר.
    </p>
    <p>
      אולם, Alexa היא לא נוחה ואינטואיטיבית כמו המתחרות שלה. היא יותר מסורבלת,
      וחווית המשתמש פחות טובה מאצל האחרות. כמו כן, בישראל, האפליקציה של Alexa לא
      זמינה להורדה, והדרך היחידה לעקוף את זה היא לשנות את חנות האפליקציות לארץ
      אחרת.
    </p>
    <p>
      לסיכום, לAlexa יש תמיכה רחבה בשוק והיא מאפשרת יותר חופש מהאחרות. אם מגוון
      וחופש יותר קריטי לך מחוויית משתמש ואין לך בעיה "לכלך קצת את הידיים" כדי
      להוריד את האפליקציה, Alexa היא בשבילך.
    </p>
  </section>

  <section
    class="s3 flex space-between"
    style="flex-direction: column; align-items: flex-end"
  >
    <img
      class="pic box"
      src="../assets/Amazon-Echo.jpg"
      alt="Couldn't load image :("
    />
    <img
      class="pic box margin-bottom"
      src="../assets/Amazon-Echo-Devices.png"
      alt="Couldn't load image :("
    />
  </section>
</asp:Content>
