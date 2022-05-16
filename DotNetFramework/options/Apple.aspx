<%@ Page Title="" Language="C#" MasterPageFile="~/options/Options.master" AutoEventWireup="true" CodeBehind="Apple.aspx.cs" Inherits="DotNetFramework.pages.WebForm3" %>
<%@ Import Namespace="DotNetFramework.utils" %>


<asp:Content ID="Content1" ContentPlaceHolderID="OptionsScreen" runat="server">
    <section class="s1">
        <h1>Apple - HomeKit</h1>
    </section>
    <section class="s2">
        <p class="f-p">
            קודם כל, אתחיל ואומר - אם אין לך מכשירים של Apple, בדגש על <%=new WikiLink("iPhone")%>, בית חכם של Apple היא לא אופציה. Apple כמו
            Apple תומכת רק במשתמשים הנאמנים שלה, ומבחינתה בית חכם שלה היא חלק מה<%=new WikiLink("ecosystem", "Apple_ecosystem")%> שלה, שדורש כמובן
            את הiPhone.
        </p>
        <p>
            אז בהנחה שיש לך iPhone, הנה תקציר.
        </p>
        <p>
            המערכת של Apple, שנקראת <%=new WikiLink("HomeKit")%> היא בעלת הכי פחות אופציות מבין השלוש. Apple תומכים בחברות בודדות, לכן המגוון הוא
            נמוך ביחד למתחרות. אבל, כנהוג בApple, תהליך ההתקנה של כל אחד מהמוצרים שלהם או שהם תומכים בו הוא
            פשוט ואינטואיטיבי. בהנחה שאתה כבר חלק מהecosystem של Apple, הכל מתחבר להכל ואתה יכול לשלוט בבית
            מכל מקום מכל מכשיר.
        </p>
        <p>
            אולם, המגוון הולך ומשתפר, וכיום, על אף שהוא זמין בעיקר בחו"ל, המגוון הרבה יותר רחב משהיה, ואפשר
            לעשות את רוב הדברים שאפשר עם המתחרות גם אצל Apple.
        </p>
        <p>
            גם מאפליקציית הקיצורים אפשר לשלוט על הבית וכך לייצר אוטומציות. כמובן, <%=new WikiLink("Siri") %>, איפה שלא נמצאת,
            יכולה גם היא לשלוט בבית. אולם, Siri נחשבת העוזרת הכי פחות טובה מבין השלוש.
        </p>
        <p>
            לסיכום, אם אתה כבר חלק מהecosystem ואתה רוצה להרחיב אותו לרמה שהוא ישלוט לך על הבית, המערכת של Apple 
            בשבילך. היא מאפשרת קלות נוחות ואינטואיטיביות. אך לאנשים שרוצים יותר ופחות חשוב להם החיבוריות 
            המדהימה של הecosystem של Apple, המערכת הזו פחות תתאים.
        </p>
        
    </section>

    <section class="s3 flex space-between" style="flex-direction: column; align-items: flex-end">
        <img class="pic box margin-bottom" src="\assets\iOS-15-HomeKit-Guide.jpg" alt="Google Home" />
        <img class="pic box" src="\assets\ios14-homepod-ipad-iphone12-pro-watch-homekit-hero.jpg" alt="Couldn't load image :(" />
    </section>
</asp:Content>
