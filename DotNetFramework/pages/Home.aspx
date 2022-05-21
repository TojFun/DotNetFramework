<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master"
    AutoEventWireup="true" CodeBehind="Home.aspx.cs"
    Inherits="DotNetFramework.pages.Home" %>

<%@ Import Namespace="DotNetFramework.utils" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../styles/home.css">
    <title>דף הבית</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScreen" runat="server">
    <div class="home">
        <section>
            <h1 class="text-center underline no-margin">בית חכם בישראל</h1>
        </section>

        <section>
            <p>
               האתר הזה נועד על מנת לעזור לישראלים להחליט האם להפוך את ביתם לחכם, ולעזור לאלו שכן
                לבצע זו. האתר כולל המלצות, הדרכות, והכוונות למוצרים ולחלקים בביתם שאפשר להחכים.
            </p>
            <p>
                על מנת לקבל את החוויה במלואה, מומלץ <%=new Link("להירשם", "../pages/Register.aspx")%> לאתר.
            </p>
        </section>

        <section>
            <table>
                <tr>
                    <td>
                        <img
                            class="image box no-padding"
                            src="../assets/iota-smart_home.jpg"
                            alt="Couldn't load :(" />
                    </td>

                    <td>
                        <iframe
                            class="youtube-video box no-padding"
                            src="https://www.youtube.com/embed/sJmplWe_cX0"
                            title="YouTube video player"
                            frameborder="0"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                            allowfullscreen="true"></iframe>
                    </td>
                </tr>
            </table>
        </section>
    </div>
</asp:Content>
