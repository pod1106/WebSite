<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyMaster.Master" AutoEventWireup="true" CodeBehind="Quiz.aspx.cs" Inherits="website.Pages.Quiz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="Quiz.js"></script>


            <style>    

        html, body {
            width: 100%;
            overflow-x: hidden;
        }
        .quiz-container {
            width: 70%;
            margin: 50px auto; 
            padding: 20px;

            padding-left: 20px;
            padding-right: 20px;
            border: 2px solid black; 
            background-color: rgb(171, 219, 255);
      
            border-radius: 8px;
            text-align: center;
            position: relative;
        }



        .quiz-container label {
            font-size: 20px; 
            font-family: Arial;
            background-color: rgb(243, 255, 189);

            display: inline-flex; 
            align-items: center;
            font-weight: bold; 
            margin: 5px;

            border: solid 2px black;
            border-radius: 5px;
            padding-left: 10px;
            padding-right: 10px;

            text-align: left;
            position: relative;
            transition: background-color 0.3s ease;
        }


        .quiz-container label:hover {
            background-color: rgb(220, 255, 160);
            text-decoration: underline;
        }




        .quiz-container #submit-btn {
            width: 260px; 
            padding: 12px; 
            font-weight: bold;
            background-color: #35c2dc; 
            color: white; 
            font-size: 24px;
            margin: 10px;
            border: none; 
            border-radius: 4px; 
            text-align: center;

            cursor: pointer; 
            transition: background-color 0.3s ease;
        }

        .quiz-container #submit-btn:hover {
            background-color: #14a8e6;
        }

        #question-container {
            font-size: 34px;
            font-weight: bold;
            padding-top: 35px;
            padding-bottom: 35px;
            padding-left: 15px;
            padding-right: 15px;
            border-radius: 8px;

            background-color: rgb(191, 239, 255);

            margin-bottom: 40px;
            
        }




    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="quiz-container">
        <div id="Quiz">

        <div id="question-container" class="question"></div>

        
        <label >
            <input type="radio" name="answ" id="option-1"/>
            <p id="answ-1"></p>
        </label>


        <label>
            <input type="radio" name="answ" id="option-2" />     
            <p id="answ-2"></p>
        </label>


        <label>
            <input type="radio" name="answ" id="option-3" />
            <p id="answ-3"></p>
        </label>


         <label>
            <input type="radio" name="answ" id="option-4" />
             <p id="answ-4"></p>
        </label>



        <ul id="options-container" class="options"></ul>

        <button id="submit-btn">Next Question</button>

        </div>
    </div>






</asp:Content>
