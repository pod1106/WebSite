<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyMaster.Master" AutoEventWireup="true" CodeBehind="NoAccessQuiz.aspx.cs" Inherits="website.Pages.NoAccessQuiz" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background: linear-gradient(to right, rgba(255, 188, 188, 0.90), rgba(247, 50, 50));
        }

        .no-access-container {
            width: 60%;
            height: 30vh;
            margin: 100px auto;
            padding: 10px; 
            border: 2px solid black;
            background-color: rgba(255, 210, 210, 0.9); 
            border-radius: 8px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); 
        }

        .no-access-container h1 {
            font-size: 40px; 
            color: rgb(120, 0, 0); 
            margin-bottom: 48px; 
        }

        .no-access-container p {
            font-size: 24px; 
            margin: 20px 0 40px; 
            color: #333; 
        }

        .no-access-container button {
            width: 200px;
            padding: 10px;
            font-size: 22px;
            margin: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .home-button {
            background-color: #3498db; /* Blue color for Home button */
            color: white;
        }

        .home-button:hover {
            background-color: #2980b9; /* Darker blue on hover */
        }

        .login-button {
            background-color: #2ecc71; /* Green color for Login button */
            color: white;
        }

        .login-button:hover {
            background-color: #27ae60; /* Darker green on hover */
        }
    </style>

    <script>
        const urlParams = new URLSearchParams(window.location.search);
        const returnUrl = urlParams.get('ReturnUrl') || 'Home.aspx';

        function redirectToLogin() {
            location.href = `Login.aspx?ReturnUrl=${encodeURIComponent(returnUrl)}`;
        }
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="no-access-container">
        <h1>Access Denied</h1>
        <p>Only logged-in users can play the quiz. Please log in to access the quiz.</p>
        <button class="home-button" onclick="location.href='Home.aspx'">Go to Home</button>
        <button class="login-button" onclick="redirectToLogin()">Login</button>
    </div>
</asp:Content>