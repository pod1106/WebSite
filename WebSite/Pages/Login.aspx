<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="website.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


        <style>    

        html, body {
            width: 100%;
            overflow-x: hidden;
        }
        .form-container {
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



        .form-container label {
            font-size: 20px; 
            font-family: Arial;

            display: block; 
            font-weight: bold; 
            margin-bottom: 5px;

            text-align: left;
            position: relative;
        }


        .form-container input {
            width: 90%; 
            padding: 10px; 
            margin: 0 auto;
            margin-bottom: 20px; 
            border: 1px solid #ccc; 
            border-radius: 6px; 
            font-size: 18px;
            text-align: left;
        }



        .form-container .login-button {
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

        .form-container .login-button:hover {
            background-color: #14a8e6;
        }





        .tooltip-text {
            opacity: 0;  
            transform: translateY(15px);
    
            width: 300px;              
            color: #6f816fff;  
            font-size: 18px;     
            background-color: #dcfed7ee;
            border: 2px solid #abd4abff;
            border-radius: 8px;     
    
            text-align: center;      
            padding: 10px;           
    
            position: absolute;      
            right: 105%;             
            top: -10px;              
    
            transition: opacity 0.3s ease-in-out, transform 0.3s ease-in-out;
        }

        .form-container label:hover .tooltip-text {
            opacity: 1;              
            transform: translateY(0);
        }




        .popup-text {
            background-color: rgba(255, 225, 225, 0.9);
            color: rgba(100, 25, 25, 1);
            border: 2px solid rgba(255, 200, 200, 1);
            border-radius: 8px;
            font-size: 18px;
            text-align: center;
    
            visibility: hidden;
            opacity: 0;
            position: absolute;  
            width: 300px;        

            top: 30px;           
            left: 103%;          
            margin-left: 10px;   

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
            background-color: rgba(225, 255, 225, 1);
            color: rgba(25, 100, 25, 1);
            border: 2px solid rgba(200, 255, 200, 1);

            font-size: 30px;
            position: fixed;
            width: 400px;
            z-index: 1000;

            left: 50%;
            transform: translate(-50%);
        }

        .popup-text.red2-popup {
            background-color: rgba(255, 225, 225, 1);
            color: rgba(100, 25, 25, 1);
            border: 2px solid rgba(255, 200, 200, 1);

            font-size: 30px;
            position: fixed;
            width: 400px;
            z-index: 1000;

            left: 50%;
            transform: translate(-50%);
        }


        a.create-account {
            width: 236px;
            font-family: Arial;
            padding: 12px; 
            font-weight: bold;

            background-color: #35c2dc; 
            color: white; 

            font-size: 24px;
            margin: 10px;

            border: none; 
            border-radius: 4px; 
            text-align: center;
            
            display: inline-block;

            text-decoration:none !important;

            cursor: pointer; 
            transition: background-color 0.3s ease;
            text-decoration: none; /* Remove underline */
        }

        /* Hover effect for the create account link */
        a.create-account:hover {
            background-color: #14a8e6;
        }















    </style>


    <script>

        function showPopup(message, theme, targetId) {
            const popup = document.getElementById(targetId);
            popup.innerText = message;

            const themes = ['red-popup', 'green-popup', 'red-popup2'];
    
            popup.classList.remove(...themes);

            if (theme) {
                popup.classList.add(`${theme}-popup`);
            }

            popup.style.visibility = 'visible';
            popup.style.opacity = 1;

            const fadeOutDelay = 3000;
            const fadeDuration = 600;

            setTimeout(() => {
                popup.style.opacity = 0;

                setTimeout(() => {
                    popup.style.visibility = 'hidden';
                }, fadeDuration);
            }, fadeOutDelay);
        }



        function validInputs(even) {
            
            
            const name = document.getElementById('username').value;
            const password = document.getElementById('password').value;
            return true;



            if (name) {
                if (name.length < 4) {
                    showPopup("Username too short!", 'red', 'popupNameText');
                    window.scrollTo({ top: 0, behavior: 'smooth' });
                    return false;
                }
            } else {
                showPopup("Username is not set!", 'red', 'popupNameText');
                window.scrollTo({ top: 0, behavior: 'smooth' });
                return false;
            }


            if (password) {
                if (password.length <= 6) {
                    showPopup("Password is too short!", 'red', 'popupPasswordText');
                    window.scrollTo({ top: 0, behavior: 'smooth' });
                    return false;
                }

            } else {
                showPopup("Password is not set!", 'red', 'popupPasswordText');
                window.scrollTo({ top: 0, behavior: 'smooth' });
                return false;
            }


            console.log("username: " + name + "\nemail: " + email + "\npassword: " + password + "\ngender: " + gender.id);
            showPopup("New account was created!", "green", 'popupText');

            
            // Reset form fields
            document.getElementById('name').value = '';
            document.getElementById('email').value = '';
            document.getElementById('password').value = '';

            localStorage.setItem('password', "");

            return true;
        }

        function togglePasswordVisibility() {
            const passwordField = document.getElementById('password');
            const confirmPasswordField = document.getElementById('confirmPassword');
            const showPasswordCheckbox = document.getElementById('showPassword');

            // Toggle the type of the password fields based on the checkbox state
            if (showPasswordCheckbox.checked) {
                // Show the password
                passwordField.type = 'text';
                confirmPasswordField.type = 'text';
            } else {
                // Hide the password
                passwordField.type = 'password';
                confirmPasswordField.type = 'password';
            }
        }


        window.onload = function () {
            if (localStorage.getItem('password')) {
                document.getElementById('password').value = localStorage.getItem('password');
            }
        }






    </script>



</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




    <div class="form-container" runat="server">
        <form autocomplete="off" runat="server">
            <!-- Username Field -->
            <label for="name">User Name
                <span class="tooltip-text">Username must be at least 4 characters</span>
                <span class="popup-text" id="popupNameText"></span>
            </label>
            <input type="text" id="username" name="username" placeholder="Enter your username" autocomplete="off" />


            <!-- Password Field -->
            <label for="password">Password
                <span class="tooltip-text">Password must be at least 7 characters long, and contain a mix of upper and lowercase letters, and numbers.</span>
                <span class="popup-text" id="popupPasswordText"></span>
            </label>
            <input type="password" id="password" name="password" placeholder="Enter your password" autocomplete="off" style="margin-bottom: 5px;" />



            <!-- Show Password Checkbox -->
            <label style="font-size:16px; display: flex; align-items: center; justify-content: flex-start; padding: 5px; margin-top: 0px;">
                <input type="checkbox" id="showPassword" onclick="togglePasswordVisibility()" style="margin-right: 10px; width: 16px; height: 16px; border: 1px solid black;">
                <span style="position: relative; top: -10px;">Show Password</span>
            </label>


            <!-- Submit Button -->
            <div>
                <asp:Button ID="btnSubmit" CssClass="login-button" runat="server" Text="Login" 
                    OnClientClick="return validInputs(event); return false" OnClick="Submit" ClientIDMode="Static" />
            </div>


            
            <div>
                <a href="Register.aspx" class="create-account">Create New Account</a>
            </div>

            
        </form>

         
    </div>
    <div class="popup-text" id="popupText"></div>


</asp:Content>
