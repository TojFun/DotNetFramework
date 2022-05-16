<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master"
    AutoEventWireup="true" CodeBehind="Recommendations.aspx.cs"
    Inherits="DotNetFramework.pages.Recommendations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>המלצות</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScreen" runat="server">
    <article>
        <div class="box article-parent">
            <section class="s1">
                <h1>ההמלצה שלי</h1>
            </section>
            <section class="s2">
                <h5>* מנוסח בלשון זכר אך פונה לכל המינים.</h5>
                <h2>במילה אחת: Google.</h2>
                <p>
                    התחלתי את דרכי עם Alexa, ובהתחלה הייתי מרוצה. היה מגוון רחב של מוצרים לבחור
          שעובדים איתה, וקניתי מנורות וכמה Echo Dots, שהם הinterface המרכזי של Amazon
          לAlexa, ופיזרתי אותם ברחבי הבית.
                </p>
                <p>
                    אך כמה דברים מרכזיים הפריעו לי. דבר ראשון, פיצ'רים רבים אינם נתמכים בארץ. רק כדי
          להוריד את האפליקציה הייתי צריך "לרמות" את חנות האפליקציות. שנית, חווית המשתמש
          הייתה פחות טובה משציפיתי. שלישית, Alexa עצמה הרבה פעמים עצבנה אותי.
                </p>
                <p>
                    אז החלטתי להחליף. תחילה, כחובב Apple מושבע חקרתי על הבית החכם שלהם. אך להפתעתי,
          Apple זוכה לביקורות לא טובות. Siri מאכזבת מאוד, הכל יקר והמבחר מצומצם. לכן בחרתי
          בGoogle.
                </p>
                <p>
                    חווית המשתמש אצל Google מצויינת. הכל קורה מתוך האפליקציה, והחיבוריות מאוד פשוטה.
            אפשר לחבר את Spotify בקלות וגם את YouTube Music, שמגיע Out of the Box בגרסה החינמית עם
            פרסומות. בחו"ל אפשר גם לחבר Apple Music ועוד. 
                </p>
                <p>
                    הדבר שהכי הרשים אותי, לאחר שנים של נסיון עם Siri וכשנה של נסיון עם Alexa, היא Google Assistant
            (שיכולה להיות גם זכר). היא העוזרת הכי חכמה בשוק. אפשר לבקש ממנה בצורה הכי אנושית דברים
            שלא הייתי מצפה ממכונה להבין, והיא תבין ותבצע. היא יכולה לחפש בשבילך דברים בGoogle (כמובן)
            והיא בוחרת לבד את התוצאה הכי רלוונטית ומקריאה לך. רק לעיתים רחוקות היא מתבלבלת (בעוד שSiri למשל
            עושה את זה כל הזמן), ואז היא נותנת לך לבחור את התוצאה המתאימה.
                </p>
                <p>
                    Google שלעצמה מציעה המון מוצרים שעובדים עם Google Home בצורה טבעית, כשכל מוצר איכותי וטוב.
            היום אצלי בבית המנעול כניסה ופעמון הכניסה חכמים, בכל חדר יש טלווזיה שאפשר בצורה זו או
            אחרת לחבר אותה לGoogle, בכל חדר יש Hub שמאפשר גישה קולית לבית, יש מצלמה פנימית, נורות
            חכמות ומזגנים חכמים.
                </p>
                <p>
                    לסיכום, לדעתי, לכל אחת מהמתחרות יש את היתרונות והחסרונות שלה. לדעתי, לרוב אם לא כל הבתים
            בישראל, Google היא הבחירה הטובה ביותר, אם כי לא הזולה ביותר. לבתים שיותר קצרים בתקציב,
            Alexa היא בחירה נהדרת. מכורי Apple, שכנראה שום דבר מזה לא שכנע אותם, Apple השתפרו מאוד בשנה שנתיים
            האחרונות, וגם הם יכולים להיות בחירה טובה מאוד לאנשים בecosystem של Apple.
                </p>
            </section>

            <section class="s3 flex space-between" style="flex-direction: column; align-items: flex-end">
                <img onclick="window.location.href='../options/Google.aspx'" class="pic margin-bottom btn" src="../assets/google-nest-smart-home-devices.jpg" alt="Couldn't load image :(" />
                <img onclick="window.location.href='../options/Amazon.aspx'" class="pic margin-bottom btn" src="../assets/Amazon-Echo.jpg" alt="Couldn't load image :(" />
                <img onclick="window.location.href='../options/Apple.aspx'" class="pic btn" src="../assets/ios14-homepod-ipad-iphone12-pro-watch-homekit-hero.jpg" alt="Couldn't load image :(" />
            </section>
        </div>
        <section>
        </section>
    </article>
</asp:Content>
