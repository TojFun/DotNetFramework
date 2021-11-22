<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master"
AutoEventWireup="true" CodeBehind="Home.aspx.cs"
Inherits="DotNetFramework.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScreen" runat="server">
  <div>
    <img class="image" src="iota-smart_home.jpg" alt="Couldn't load :(" />
  </div>

  <div>
    <iframe
      class="youtube-video"
      src="https://www.youtube.com/embed/sJmplWe_cX0"
      title="YouTube video player"
      frameborder="0"
      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
      allowfullscreen="true"
    ></iframe>
  </div>
</asp:Content>
