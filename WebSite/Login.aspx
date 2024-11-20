<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="website.Login" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-container {
            max-width: 500px; 
            margin: 50px auto; 
            padding: 20px; 
            border: 2px solid black; 
            background-color: rgba(0, 0, 0, 0.05);
            font-size: 20px; 
            font-family: Arial;
            border-radius: 8px;
            text-align: center;
        }

        .form-container label {
            display: block; 
            font-weight: bold; 
            margin-bottom: 5px;
            text-align: left;
            position: relative;  /* Allow the tooltip to be positioned relative to this label */
        }

        .form-container input {
            width: 90%; 
            padding: 10px; 
            margin-bottom: 20px; 
            border: 1px solid #ccc; 
            border-radius: 4px; 
            font-size: 18px;
            text-align: left;
        }

        .form-container button {
            width: 40%; 
            padding: 12px; 
            background-color: #57e4fe; 
            color: white; 
            font-size: 16px; 
            border: none; 
            border-radius: 4px; 
            cursor: pointer; 
            transition: background-color 0.3s ease;
        }

        .form-container button:hover {
            background-color: #15b9f7;
        }

        /* Tooltip style */
        .tooltip-text {
            visibility: hidden;
            width: 250px;
            color: #AAA;

            background-color: #EFE;
            
            text-align: center;

            border: 2px solid #DED; 
            border-radius: 8px;

            padding: 5px;
            position: absolute;
            z-index: 1;
            bottom: -60px; /* Position above the label */
            left: -175px;
            margin-left: -125px; /* Center the tooltip horizontally */
            opacity: 0;
            transition: opacity 0.6s ease;
            font-size: 16px;
        }

        .form-container label:hover .tooltip-text {
            visibility: visible;
            opacity: 1;
        }

    </style>


    <script>
        function validInputs() {
            const name = document.getElementById('name').value;
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;




            if (name) {
                if (name.length < 4) {
                    alert("Username has to be at least 4 characters!");
                    return;
                }
            } else {
                alert("Username is not set!");
                return;
            }

            if (email) {

            }

            if (email) {
                const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                if (emailRegex.test(email)) {
                    alert("Email is valid!");
                } else {
                    alert("Email is not valid!");
                }
            } else {
                alert("Email is not set!");
            }



            if (password) {
                if (password.length >= 7) {

                    if (!/[a-z]/.test(password)) {
                        alert("Password needs to contain a lowercase letter.");
                        return;
                    }

                    if (!/[A-Z]/.test(password)) {
                        alert("Password needs to contain an uppercase letter.");
                        return;
                    }

                    if (!/[0-9]/.test(password)) {
                        alert("Password needs to contain a number.");
                        return;
                    }

                } else {
                    alert("Password must be at least 7 characters long.");
                }
            } else {
                alert("Password is not set!");
            }




        }


    </script>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
        <form autocomplete="off">
            <label for="name">User Name
                <span class="tooltip-text">Username must be at least 4 charachters</span>
            </label> 
            <input type="text" id="name" name="name" placeholder="Enter your username" required autocomplete="off" />

            <label for="email">Email</label>
            <input type="text" id="email" name="email" placeholder="Enter your email" required autocomplete="off" />

            <label for="password">Password
                <span class="tooltip-text">Password must be at least 7 characters long, and contain a mix of upper and lowercase letters, and numbers.</span>
            </label>
            <input type="text" id="password" name="password" placeholder="Enter your password" required autocomplete="off" />

            <button type="submit">Send</button>
        </form>
    </div>
</asp:Content>
