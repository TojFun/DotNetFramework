<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master"
    AutoEventWireup="true" CodeBehind="WhereToBegin.aspx.cs"
    Inherits="DotNetFramework.pages.WhereToBegin" %>

<%@ Import Namespace="DotNetFramework.utils" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../styles/wtb.css" />
    
    <title>איך מתחילים</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScreen" runat="server">
    <article >
        <div class="box article-parent">
            <section class="s1">
                <h1>איפה מתחילים</h1>
            </section>
            <section class="s2">
                <h5>* מנוסח בלשון זכר אך פונה לכל המינים.</h5>
                <h2>עוקבים אחרי השלבים הבאים:</h2>
                <%= new OrderedList(new string[]{ 
                    $"לבחור מאחד משלושת החברות - ראה {new Link( "אופציות", "../options/Google.aspx")}",
                    "לעשות רשימה של דברים שהיית רוצה להחכים",
                    "לבנות ארכיטקטורה של הבית החכם (על נייר), כולל לקבוע תקציב",
                    $"להתחיל לקנות - ראה למטה {new Link("מוצרים מומלצים", "#products")}",
                    "לאתחל את הבית החכם שלך באפליקציה שנבחרה",
                    "לחבר ולהתקין את המוצרים",
                    "לייצר אוטומציות - לבחירתך"
                }, childStyle: new Dictionary<string, string> { { "margin-bottom", "0.8em"} }) %>

                <h4>וזהו! מפה אפשר להתחיל להנות!</h4>
            </section>

            <section class="s3 flex space-between" style="flex-direction: column; align-items: flex-end">
                <img class="pic box" src="../assets/smart-home-happy.jpg" alt="Couldn't load image :(" />
            </section>
        </div>
        <section id="products" class="pics">
            <%=new ImageLink("../assets/google-nest-hub.jpg", "https://store.google.com/us/product/nest_hub_2nd_gen?hl=en-US", 
            "<b>Google Nest Hub</b> - הגרסה הקטנה של האינטרפייס הכי טוב לתקשר עם הGoogle Assistant.") %>
            
            <%=new ImageLink("../assets/homepod-mini.jpg", "https://www.apple.com/homepod-mini/",
            "<b>Apple HomePod Mini</b> - הרמקול של Apple לתקשר עם Siri.") %>
            
            <%=new ImageLink("../assets/echo-dot.jpg", "https://www.amazon.com/Echo-Dot/dp/B07XJ8C8F5", 
            "<b>Amazon Echo Dot</b> - הרמקול של Amazon לתקשר עם Alexa, בדור הרביעי. אפשר גם לקנות עם שעון מובנה.") %>
            
            <%=new ImageLink("../assets/chromecast.jpg", "https://store.google.com/us/product/chromecast_google_tv?hl=en-US",
            "<b>Chromecast with Google TV</b> - הממיר הקטן של Google, שמתחבר לכל טלוויזיה בקלות והופך אותה לחכמה, חכמה יותר מטלווזיות" +
            " חכמות אחרות בשוק. השלט שלו מספיק חכם כדי שלא תצטרך את הישן, אפילו לא להדלקה.") %>
            
            <%=new ImageLink("../assets/sensibo.jpg", "https://sensibo.com/", "<b>Sensibo Air</b> - מוצר קטן שהופך " +
            "כל מזגן למזגן חכם. הוא התנהג כמו שלט אוניברסלי, שניתן להפעיל אותו מכל מקום, ליצור אוטומציות," +
            " וגם לחבור אותו לכל שלושת סוגי הבית החכם.") %>
            
            <%=new ImageLink("../assets/Sonos-One.jpg", "https://www.sonos.com/en/shop/one", "<b>Sonos One</b> - " +
            "רמקול איכותי מאוד שיחד עם עוד כמה מוצרי Sonos הופך למערכת קול של בית קולנוע. הרמקול" +
            "יכול להתנהג גם כמו רמקול חכם והוא מתחבר לבתים החכמים של Amazon וGoogle ואפילו אפשר לדבר עם" +
            "אחת מהעוזרות החכמות.") %>
        </section>
    </article>
</asp:Content>
