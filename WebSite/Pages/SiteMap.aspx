<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyMaster.Master" AutoEventWireup="true" CodeBehind="SiteMap.aspx.cs" Inherits="website.Pages.SiteMap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

      <style>
        h1 {
            text-align: center;
            font-size: 48px;
            color: #2c3e50;
            margin-bottom: 20px;
        }
        hr {
            width: 80%;
            margin: 0 auto;
            border: 1px solid #3498db;
            margin-bottom: 40px;
        }

        #main {
            display: flex;
            gap: 60px;
            justify-content: center;
            padding-bottom: 100px;
            
        }
        .link-section {
            background-color: #fff;
            padding: 20px;
            width: 300px;
            border-radius: 8px;
            box-shadow: -15px 15px 4px rgba(0,0,0,0.1);
            font-size: 24px;
            font-weight: bold;
            border: 1px solid rgb(210, 210, 210);    
        }

        h2 {
          margin-bottom: 10px;
          font-size: 34px;
        }

        ul {
          list-style-type: none;
          padding-left: 0;
        }

        li {
          margin: 8px 0;
        }

  </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h1>Site Map</h1>
     <hr />
    <section id="main">
        <section class="link-section">
            <h2>General Links</h2>
            <ul>
                <li><a href="Home.aspx">Home</a></li>
                <li><a href="Quiz.aspx">Quiz</a></li>
                <li><a href="Leaderboard.aspx">Leaderboard</a></li>
                <li><a href="Login.aspx">Login</a></li>
                <li><a href="Register.aspx">Register</a></li>
            </ul>
        </section>

        <section class="link-section">
            <h2>Wonder Links</h2>
            <ul>
                <li><a href="Wonders/great_wall_of_china.aspx">Great wall of china</a></li>
                <li><a href="Wonders/christ_the_redeemer.aspx">Christ the redeemer</a></li>
                <li><a href="Wonders/romancolosseum.aspx">Roman colosseum</a></li>
                <li><a href="Wonders/machu_picchu.aspx">Machu picchu</a></li>
                <li><a href="Wonders/chichen_itza.aspx">Chichen itza</a></li>
                <li><a href="Wonders/taj_mahal.aspx">Taj mahal</a></li>
                <li><a href="Wonders/petra.aspx">Petra</a></li>
            </ul>
        </section>


    </section>
</asp:Content>
