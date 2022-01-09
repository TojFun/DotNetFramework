<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master"
AutoEventWireup="true" CodeBehind="Home.aspx.cs"
Inherits="DotNetFramework.pages.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <link rel="stylesheet" href="../styles/home.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScreen" runat="server">
  <table>
    <tr>
      <td>
        <img
          class="image"
          src="../assets/iota-smart_home.jpg"
          alt="Couldn't load :("
        />
      </td>

      <td>
        <iframe
          class="youtube-video"
          src="https://www.youtube.com/embed/sJmplWe_cX0"
          title="YouTube video player"
          frameborder="0"
          allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
          allowfullscreen="true"
        ></iframe>
      </td>
    </tr>
  </table>
</asp:Content>
