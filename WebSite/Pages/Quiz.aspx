<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyMaster.Master" AutoEventWireup="true" CodeBehind="Quiz.aspx.cs" Inherits="website.Pages.Quiz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="Quiz.js"></script>


            <style>    

        html, body {
            width: 100%;
            overflow-x: hidden;
        }
        .quiz-container {
            width: min(800px, 80vw); 
            max-width: 100%;
            margin: 50px auto; 
            padding: 20px;

            padding-left: 20px;
            padding-right: 20px;
            border: 2px solid black; 
            background-color: rgba(0, 0, 0, 0.1);
      
            border-radius: 8px;
            text-align: center;
            position: relative;
        }



        .quiz-container label {
            font-size: 20px; 
            font-family: Arial;

            display: block; 
            font-weight: bold; 
            margin-bottom: 5px;

            text-align: left;
            position: relative;
        }


        .quiz-container input {
            width: 90%; 
            padding: 10px; 
            margin: 0 auto;
            margin-bottom: 20px; 
            border: 1px solid #ccc; 
            border-radius: 6px; 
            font-size: 18px;
            text-align: left;
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





    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="quiz-container">
        <div id="question-container" class="question"></div>
        <label>
            <input type="radio" />
            a
        </label>

        <label>
            <input type="radio" />
            b
        </label>

        <label>
            <input type="radio" />
            c
        </label>

         <label>
            <input type="radio" />
            d
        </label>
        <ul id="options-container" class="options"></ul>

        <button id="submit-btn">Submit Answer</button>
    </div>






</asp:Content>
