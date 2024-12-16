<%@ Page Title="7 Wonders of the World" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="website.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Basic styles for the layout */
        body {
            height: 200vh;
            background-size: cover; 
            background-position: center center;
            background-attachment: fixed;

            animation: slide 60s ease-in-out infinite;
        }

        @keyframes slide {
            0%, 100% { background-image: url("img/great_wall_of_china.jpg"); }
            16.67% { background-image: url('img/petra.jpg'); }
            33.33% { background-image: url('img/christ_the_redeemer.jpg'); }
            50% { background-image: url('img/machu_picchu.jpg'); }
            66.67% { background-image: url("img/chichen_itza.jpg"); }
            83.33% { background-image: url("img/romancolosseum.jpg"); }
        }

        .container {
            display: flex;             /* Enable Flexbox */
            justify-content: center;   /* Center horizontally */
            align-items: center;       /* Center vertically */
            height: 90%;             /* Use full viewport height */
        }



        @keyframes fadeInUp {
              0% { opacity: 0; transform: translateY(50px); }
              100% { opacity: 1; transform: translateY(0); }
        }

        table {
            position: sticky;
            width: 70%;
            top: 250px;
            margin: 500px auto;
            border-collapse: separate;
            border-spacing: 15px;
            overflow: hidden;
            position: relative;
            padding: 20px;
            background-color: rgba(240, 240, 240, 0.4);
            backdrop-filter: blur(20px);
            border-radius: 10px;
            animation: fadeInUp 1s ease-in-out;
        }


        th, td {
            padding: 20px;
            text-align: center;
            background-color: rgba(240, 240, 240, 0.6);
            border-radius: 8px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }


        td:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3); /* Subtle hover effect */
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
            height: 180px;
            object-fit: cover; 
            border-radius: 8px;
        }

       .wonder-link h3 {
            font-size: 1.5em;
            color: #333;
            margin-top: 10px;
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
        <!-- Sidebar -->


        
        <table>
            <tr>
                <td colspan="4" style="padding-inline: 50px; font-size: 30px;">
                    <h2>Welcome to the 7 Wonders of the World!</h2>
                    <p>Explore the incredible landmarks that have captivated the world for centuries.<br /> Learn fascinating facts, test your knowledge with fun quizzes, and enjoy stunning images of these awe-inspiring wonders. Let the adventure begin!</p>
                </td>
            </tr>
            <tr>
                <td class="tablelink">
                    <a href="Wonders/great_wall_of_china.aspx" class="wonder-link">
                        <img src="img/great_wall_of_china.jpg" alt="Great Wall of China" class="wonder-img">
                        <h3>Great Wall of China</h3>
                    </a>
                </td>
                <td class="tablelink">
                    <a href="Wonders/petra.aspx" class="wonder-link">
                        <img src="img/petra.jpg" alt="Petra" class="wonder-img">
                        <h3>Petra</h3>
                    </a>
                </td>
                <td class="tablelink">
                    <a href="Wonders/christ_the_redeemer.aspx" class="wonder-link">
                        <img src="img/christ_the_redeemer.jpg" alt="Christ the Redeemer" class="wonder-img">
                        <h3>Christ the Redeemer</h3>
                    </a>
                </td>
                <td class="tablelink">
                    <a href="Wonders/machu_picchu.aspx" class="wonder-link">
                        <img src="img/machu_picchu.jpg" alt="Machu Picchu" class="wonder-img">
                        <h3>Machu Picchu</h3>
                    </a>
                </td>
            </tr>
            <tr>
                <td class="tablelink">
                    <a href="Wonders/chichen_itza.aspx" class="wonder-link">
                        <img src="img/chichen_itza.jpg" alt="Chichen Itza" class="wonder-img">
                        <h3>Chichen Itza</h3>
                    </a>
                </td>
                <td class="tablelink">
                    <a href="Wonders/romancolosseum.aspx" class="wonder-link">
                        <img src="img/romancolosseum.jpg" alt="Roman Colosseum" class="wonder-img">
                        <h3>Roman Colosseum</h3>
                    </a>
                </td>
                <td class="tablelink">
                    <a href="Wonders/taj_mahal.aspx" class="wonder-link">
                        <img src="img/taj_mahal.jpg" alt="Taj Mahal" class="wonder-img">
                        <h3>Taj Mahal</h3>
                    </a>
                </td>
                   
                <td class="tablelink"> <!-- Empty cell to maintain structure -->
                     quiz. soon!!
                </td> 
            </tr>
        </table>
     </div>



</asp:Content>


