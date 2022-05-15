<%@ Page Title="" Language="C#" MasterPageFile="~/options/Options.master" AutoEventWireup="true" CodeBehind="Google.aspx.cs" Inherits="DotNetFramework.pages.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="OptionsScreen" runat="server">
    <section class="s1">
        <h1>Google - Google Home</h1>
    </section>
    <section class="s2">
        <p class="f-p">
            הפלטפורמה של Google נקראת Google Home - אפליקציה לסמארטפון שיכולה להתחבר לכל המכשירים
                שתומכים בGoogle ולנהל את הבית כולו מתוכה.
        </p>
        <p>
            Google קנו את Nest ב2014, ומאז הם משדרגים את הבית החכם ביחד עם מוצרים כמו מנעול חכם
                ומצלמות אבטחה, שאמנם דורשים אפליקציה נוספת של Nest, אבל ברגע שהמוצר מחובר אלייה, הוא אוטומטית
                הופך זמין לשליטה דרך האפליקציה הראשית.
        </p>
        <p>
            Google מייצרת בעצמה או דרך Nest מוצרים רבים לבית, אך תומכת בהמון מוצרים צד שלישי, שלעיתים
                דורשים חיבור אפליקציה נוספת לאפליקציה הראשית (בקלות) ואפילו חלק מתחברים כמו מוצר טבעי.
        </p>
        <p>
            העוזרת הקולית של Google (בעלת אותו השם) נמצאת בכל מקום, אם זה בNest Hub ששולט בכל הבית דרכה
                או דרך המסך שאיתו מגיע, או בטלוויזיה, בטלפון החכם ואפילו ברמקולים צד שלישי כמו Sonos.
                מהנסיון האישי שלי, אין ספק שGoogle Assistant היא העוזרת החכמה והטובה מבין כל המתחרות.
        </p>
        <p>
            עם Routines, שכרגע עוד לא זמין בארץ אך אפשר לעקוף את זה על ידי שינוי הRegion לארץ אחרת,
                מאפשר יצירת אוטומציות שמופעלות על ידי פקודה, זמן או המיקום שלך.
        </p>
        <p>
            החיסרון המרכזי של Google מAmazon שהמערכת קצת יותר סגורה, עם פחות Skills, ועם קצת פחות תמיכה במוצרים צד שלישי,
                בדגש על קצת.
        </p>
        <p>
            לסיכום, Google ממרכזת את כל הבית לפלטפורמה אחת. היא ידידותית למשתמשים ועם מגוון יחסית רחב
                של אפשרויות.
        </p>
    </section>

    <section class="s3 flex space-between" style="flex-direction: column; align-items: flex-end">
        <img class="pic .margin-bottom" src="\assets\google-home.png" alt="Google Home" />
        <img class="pic box" src="\assets\google-nest-smart-home-devices.jpg" alt="Couldn't load image :(" />
    </section>
</asp:Content>
