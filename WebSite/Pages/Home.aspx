<%@ Page Title="7 Wonders of the World" Language="C#" MasterPageFile="~/MasterPages/MyMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="website.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            height: 100vh;
            background-size: cover; 
            background-position: center;
            animation: slide 60s ease-in-out infinite;
        }

        @keyframes slide {
            0%, 100% { background-image: url("../img/great_wall_of_china.jpg"); }
            14.29% { background-image: url('../img/petra.jpg'); }
            28.57% { background-image: url('../img/christ_the_redeemer.jpg'); }
            42.86% { background-image: url('../img/machu_picchu.jpg'); }
            57.14% { background-image: url("../img/chichen_itza.jpg"); }
            71.43% { background-image: url("../img/romancolosseum.jpg"); }
            85.71% { background-image: url("../img/taj_mahal.jpg"); }
        }





        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 80%;
        }

        table {
            width: 70%;
            top: 40px;
            border-spacing: 15px;
            position: relative;
            padding: 20px;
            background-color: rgba(240, 240, 240, 0.4);
            backdrop-filter: blur(20px);
            border-radius: 10px;
            animation: fadeInUp 1s ease-in-out;
        }

        @keyframes fadeInUp {
            0% { opacity: 0; transform: translateY(50px); }
            100% { opacity: 1; transform: translateY(0); }
        }






        th, td {
            padding: 8px;
            text-align: center;
            background-color: rgba(240, 240, 240, 0.6);
            border-radius: 8px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }


        td:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
        }

        td.no-hover:hover {
            transform: none;
            box-shadow: none;
        }


        a {
            text-decoration: none;
        }


        .wonder-link {
            text-align: center;
            display: block;
        }

        .wonder-img {
            width: 100%;
            height: 140px;
            object-fit: cover; 
            border-radius: 8px;
        }

       .wonder-link h3 {
            font-size: 1.5em;
            color: #333;
            margin-top: 6px;
       }

        
        .tablelink {
            transition: transform 0.3s ease-in-out;
        }

        .tablelink:hover {
            text-decoration: underline;
            color: black;
            transform: scale(1.05);
        }
    </style>


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

        <table>
            <tr>
                <td colspan="4" style="padding-inline: 50px; font-size: 24px;" class="no-hover">
                    <h2>Welcome to the 7 Wonders of the World!</h2>
                    <p>Explore incredible landmarks that have captivated the world for centuries.<br />
                        Learn fascinating facts and test your knowledge with fun quizzes.<br />
                        Enjoy breathtaking images of these famous wonders!</p>
                </td>
            </tr>

            <tr>
                <td class="tablelink">
                    <a href="Wonders/great_wall_of_china.aspx" class="wonder-link">
                        <img src="../img/great_wall_of_china.jpg" alt="Great Wall of China" class="wonder-img">
                        <h3>Great Wall of China</h3>
                    </a>
                </td>
                <td class="tablelink">
                    <a href="Wonders/petra.aspx" class="wonder-link">
                        <img src="../img/petra.jpg" alt="Petra" class="wonder-img">
                        <h3>Petra</h3>
                    </a>
                </td>
                <td class="tablelink">
                    <a href="Wonders/christ_the_redeemer.aspx" class="wonder-link">
                        <img src="../img/christ_the_redeemer.jpg" alt="Christ the Redeemer" class="wonder-img">
                        <h3>Christ the Redeemer</h3>
                    </a>
                </td>
                <td class="tablelink">
                    <a href="Wonders/machu_picchu.aspx" class="wonder-link">
                        <img src="../img/machu_picchu.jpg" alt="Machu Picchu" class="wonder-img">
                        <h3>Machu Picchu</h3>
                    </a>
                </td>
            </tr>

            <tr>
                <td class="tablelink">
                    <a href="Wonders/chichen_itza.aspx" class="wonder-link">
                        <img src="../img/chichen_itza.jpg" alt="Chichen Itza" class="wonder-img">
                        <h3>Chichen Itza</h3>
                    </a>
                </td>
                <td class="tablelink">
                    <a href="Wonders/romancolosseum.aspx" class="wonder-link">
                        <img src="../img/romancolosseum.jpg" alt="Roman Colosseum" class="wonder-img">
                        <h3>Roman Colosseum</h3>
                    </a>
                </td>
                <td class="tablelink">
                    <a href="Wonders/taj_mahal.aspx" class="wonder-link">
                        <img src="../img/taj_mahal.jpg" alt="Taj Mahal" class="wonder-img">
                        <h3>Taj Mahal</h3>
                    </a>
                </td>
                   
                <td class="tablelink">
                        <a href="Quiz.aspx" class="wonder-link">
                            <h3>Test Your Knowledge!</h3>
                        </a>
                </td> 
            </tr>
        </table>
     </div>



</asp:Content>


