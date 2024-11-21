<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="website.Login" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-container {
            max-width: 500px; 
            margin: 50px auto; 
            padding: 20px;
            padding-right: 0px;
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
            position: relative;
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
            visibility: hidden;     /* default value, hidden */
            opacity: 0;

            width: 250px;           /* window width */
            color: #AAA;            /* text color */
            font-size: 16px;        /* text size */
            background-color: #EFE; /* window color */
            border: 2px solid #DED; /* boarder width, type and color */
            border-radius: 8px;     /* boarder radius */
             
            text-align: center;     /* text possition in window */
            padding: 10px;          /* in window padding */
            
            position: absolute;     /* window possition */
            right: 530px;           /* window possition relative to the label */

            transition: opacity 0.6s ease;   /* animation  */
            
        }

        .form-container label:hover .tooltip-text {
            visibility: visible;
            opacity: 1;
        }



        .popup-text {
            background-color: rgba(255, 225, 225, 0.9);
            color: rgba(100, 25, 25, 1);
            border: 2px solid rgba(255, 200, 200, 1);
            border-radius: 8px;
    
            visibility: hidden;
            opacity: 0;
            position: absolute;  /* Positioning the popup relative to the label */
            width: 250px;        /* Adjust the width of the popup */
            top: 25px;              /* Align with the top of the label */
            left: 500px;          /* Place the popup to the right of the label */
            margin-left: 10px;   /* Add some space between the label and popup */

            padding: 10px;
            border-radius: 8px;
            transition: opacity 0.6s ease;
        }

        .popup-text.red-popup {
            background-color: rgba(255, 225, 225, 0.9);
            color: rgba(100, 25, 25, 1);
            border: 2px solid rgba(255, 200, 200, 1);
        }

        .popup-text.green-popup {
            background-color: rgba(225, 255, 225, 0.9);
            color: rgba(25, 100, 25, 1);
            border: 2px solid rgba(200, 255, 200, 1);
            position: fixed;
            left: 50%;               /* Position the left edge at 50% of the viewport */
            top: 650px;                /* Optional: Center it vertically as well */
            transform: translate(-50%, -50%);
        }

    </style>


    <script>
        function showPopup(message, theme = 'red', targetId) {
            const popup = document.getElementById(targetId);
            popup.innerText = message; // Set the message passed to the function

            // Remove the old theme class (if any) and add the new theme class
            popup.classList.remove('red-popup', 'green-popup');
            if (theme === 'green') {
                popup.classList.add('green-popup');
            } else {
                popup.classList.add('red-popup');
            }

            popup.style.visibility = 'visible'; // Make the popup visible
            popup.style.opacity = 1; // Make the popup fully opaque

            // Optional: Automatically hide the popup after 3 seconds
            setTimeout(() => {
                popup.style.opacity = 0; // Fade out the popup (opacity)

                // Wait for the fade-out to complete before setting visibility to 'hidden'
                setTimeout(() => {
                    popup.style.visibility = 'hidden'; // Hide the popup
                }, 600); // Wait for 0.6 seconds before hiding the popup
            }, 2000); // Hide after 3 seconds (adjust as needed)
        }

        function validInputs() {
            const name = document.getElementById('name').value;
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;

            showPopup("New account was created!", "green", 'popupNameText');
            return;


            if (name) {
                if (name.length < 4) {
                    showPopup("Username has to be at least 4 characters!", 'red', 'popupNameText');
                    return;
                }
            } else {
                showPopup("Username is not set!", 'red', 'popupNameText');
                return;
            }

            if (email) {
                const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                if (!emailRegex.test(email)) {
                    showPopup("Email is not valid!", 'red', 'popupEmailText');
                    return;
                }
            } else {
                showPopup("Email is not set!", 'red', 'popupEmailText');
                return;
            }

            if (password) {
                if (password.length >= 7) {
                    if (!/[a-z]/.test(password)) {
                        showPopup("Password needs to contain a lowercase letter.", 'red', 'popupPasswordText');
                        return;
                    }
                    if (!/[A-Z]/.test(password)) {
                        showPopup("Password needs to contain an uppercase letter.", 'red', 'popupPasswordText');
                        return;
                    }
                    if (!/[0-9]/.test(password)) {
                        showPopup("Password needs to contain a number.", 'red', 'popupPasswordText');
                        return;
                    }
                } else {
                    showPopup("Password must be at least 7 characters long.", 'red', 'popupPasswordText');
                    return;
                }
            } else {
                showPopup("Password is not set!", 'red', 'popupPasswordText');
                return;
            }

            showPopup("New account was created!", "green", 'popupNameText');

            // Reset form fields
            //document.getElementById('name').value = '';
            //document.getElementById('email').value = '';
            //document.getElementById('password').value = '';
        }


        document.addEventListener('DOMContentLoaded', function () {
            const submitButton = document.querySelector('button[type="button"]');
            submitButton.addEventListener('click', function (event) {
                event.preventDefault();  // Prevent form submission
                validInputs();           // Run validation
            });
        });


    </script>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
        <form autocomplete="off">
            <label for="name">User Name
                <span class="tooltip-text">Username must be at least 4 charachters</span>
                <span class="popup-text" id="popupNameText"></span>
            </label> 
            <input type="text" id="name" name="name" placeholder="Enter your username" required autocomplete="off" />

            <label for="email">Email
                <span class="popup-text" id="popupEmailText"></span> 
            </label>
            <input type="text" id="email" name="email" placeholder="Enter your email" required autocomplete="off" />

            <label for="password">Password
                <span class="tooltip-text">Password must be at least 7 characters long, and contain a mix of upper and lowercase letters, and numbers.</span>
                <span class="popup-text" id="popupPasswordText"></span>
            </label>
            <input type="text" id="password" name="password" placeholder="Enter your password" required autocomplete="off" />

            <label for="confirm-password">confirm password
                <span class="tooltip-text">Password must be at least 7 characters long, and contain a mix of upper and lowercase letters, and numbers.</span>
                <span class="popup-text" id="popupConfirmPasswordText"></span>
            </label>
            <input type="text" id="confirm-password" name="password" placeholder="Confirm password" required autocomplete="off" />

            <button type="button">Send</button>
        </form>
        <div class="popup-text" id="popupText"></div>
    </div>
</asp:Content>
