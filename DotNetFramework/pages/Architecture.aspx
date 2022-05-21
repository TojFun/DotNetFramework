<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master"
    AutoEventWireup="true" CodeBehind="Architecture.aspx.cs"
    Inherits="DotNetFramework.pages.Architecture" %>

<%@ Import Namespace="DotNetFramework.utils" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../styles/architecture.css" />

    <title>ארכיטקטורה</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScreen" runat="server">
    <article class="box article-parent">
        <section class="text-center">
            <h1>ארכיטקטורה</h1>
        </section>
        <section>
            <h5>* מנוסח בלשון זכר אך פונה לכל המינים.</h5>
            <h2>רעיון לארכיטקטורה</h2>
            <p>
                לפניכם תרשים של ארכיטקטורה של בית חכם מומצא של בוחר Google Home. בתרגשים השתמשתי במוצרים
                שאת חלקם יש לי בעצמי וחלקם (אלו שלא מייוצרים על ידי Google) יכולים לשמש גם בוחרי Apple או
                Amazon. כשאתם מתכננים את הבית שלכם, תוכלו לקחת דף זה כהשראה, ואף לקחת מוצרים, שכן המוצרים
                המוצגים בסלון ובחדר העבודה מנוסים ומומלצים.
            </p>
        </section>

        <section>
            <h2 class="level-1 rectangle box">הבית</h2>
            <ol class="level-2-wrapper">
                <li>
                    <h3 class="level-2 rectangle box">חדר שינה</h3>
                    <ol class="level-3-wrapper">
                        <li>
                            <%=new ImageLink("../assets/audio.jpg","https://store.google.com/us/product/nest_audio?hl=en-US","Google Nest Audio", "level-3 rectangle box")%>
                        </li>
                        <li>
                            <%=new ImageLink("../assets/roller-blind.jpg","https://www.ikea.com/il/he/p/fyrtur-block-out-roller-blind-wireless-battery-operated-grey-20408178/","וילון חכם של IKEA", "level-3 rectangle box")%>
                        </li>
                        <li>
                            <%=new ImageLink("../assets/hue.jpg","https://www.philips-hue.com/en-us/p/hue-white-ambiance-1-pack-e26/046677548490","נורה חכמה של Philips Hue", "level-3 rectangle box")%>
                        </li>
                    </ol>
                </li>
                <li>
                    <h3 class="level-2 rectangle box">סלון ומטבח</h3>
                    <ol class="level-3-wrapper">
                        <li>
                            <%=new ImageLink("../assets/nest-max.jpg","https://store.google.com/us/product/google_nest_hub_max?hl=en-US","Google Nest Hub Max", "level-3 rectangle box")%>
                        </li>
                        <li>
                            <%=new ImageLink("../assets/nest-cam.jpg","https://store.google.com/us/product/nest_cam_indoor?hl=en-US","מצלמה פנימית של Google Nest", "level-3 rectangle box")%>
                        </li>
                        <li>
                            <%=new ImageLink("../assets/nest-lock.jpg","https://store.google.com/us/product/nest_x_yale_lock?hl=en-US","מנעול חכם של Yale", "level-3 rectangle box")%>
                        </li>
                    </ol>

                </li>
                <li>
                    <h3 class="level-2 rectangle box">חדר עבודה</h3>
                    <ol class="level-3-wrapper">
                        <li>
                            <%=new ImageLink("../assets/google-nest-hub.jpg","https://store.google.com/us/product/nest_hub_2nd_gen?hl=en-US","Google Nest Hub", "level-3 rectangle box")%>
                        </li>
                        <li>
                            <%=new ImageLink("../assets/chromecast.jpg","https://store.google.com/us/product/chromecast_google_tv?hl=en-US","Chrome Cast With Google TV", "level-3 rectangle box")%>
                        </li>
                        <li>
                            <%=new ImageLink("../assets/sensibo.jpg","https://sensibo.com/","Sensibo Air", "level-3 rectangle box")%>
                        </li>
                    </ol>
                </li>
            </ol>
        </section>
    </article>
</asp:Content>
