<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="website.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


        <style>    

body,html {
    width: 100%;
    overflow-x: hidden
}

.form-container {
    width: min(800px,80vw);
    margin: 100px auto;
    padding: 20px;
    border: 2px solid #000;
    background-color: #f0f0f0;
    border-radius: 8px;
    text-align: center;
    position: relative
}

.form-container label {
    font-size: 22px;
    font-family: Arial;
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
    text-align: left;
    position: relative
}

.form-container input {
    width: 90%;
    padding: 10px;
    margin: 0 auto 20px;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-size: 18px;
    text-align: left
}

.form-container .login-button,a.create-account {
    width: 200px;
    padding: 12px;
    font-weight: 700;
    background-color: #35c2dc;
    color: white;
    font-size: 24px;
    margin: 10px;
    border: 0;
    border-radius: 4px;
    text-align: center;
    cursor: pointer;
    transition: background-color .3s ease
}

.login-button:hover,a.create-account:hover {
    background-color: #14a8e6
}


.reset-button {
    width: 100px; 
    padding: 12px; 
    font-weight: bold;
    background-color: rgb(250, 82, 88); 
    color: white; 
    font-size: 24px;
    margin: 20px;
    border: none; 
    border-radius: 4px; 
    text-align: center;

    cursor: pointer; 
    transition: background-color 0.3s ease;
}

.reset-button:hover {
    background-color: rgb(227, 54, 61);
}

.popup-text,.tooltip-text {
    font-size: 18px;
    text-align: center;
    opacity: 0;
    position: absolute;
    width: 300px;
    padding: 10px;
    border-radius: 8px
}

.tooltip-text {
    transform: translateY(15px);
    color: #6f816fff;
    background-color: #dcfed7ee;
    border: 2px solid #abd4abff;
    right: 105%;
    top: -10px;
    transition: opacity .3s ease-in-out,transform .3s ease-in-out
}

.form-container label:hover .tooltip-text {
    opacity: 1;
    transform: translateY(0)
}

.popup-text {
    visibility: hidden;
    top: 30px;
    left: 103%;
    margin-left: 10px;
    transition: opacity .6s ease
}

.popup-text,.popup-text.red-popup {
    background-color: rgba(255,225,225,.9);
    color: #641919;
    border: 2px solid #ffc8c8
}

.popup-text.green-popup,.popup-text.red2-popup {
    background-color: #e1ffe1;
    color: #196419;
    border: 2px solid #c8ffc8;
    font-size: 30px;
    position: fixed;
    width: 400px;
    z-index: 1000;
    left: 50%;
    transform: translate(-50%)
}

.popup-text.red2-popup {
    background-color: #ffe1e1;
    color: #641919;
    border: 2px solid #ffc8c8
}

a.create-account {
    width: 236px;
    font-family: Arial;
    display: inline-block;
    text-decoration: none!important;
}

    </style>

    <script>

        function showPopup(message, theme, targetId) {
            const popup = document.getElementById(targetId);
            popup.innerText = message;

            popup.classList.add(`${theme}-popup`);

            popup.style.visibility = 'visible';
            popup.style.opacity = 1;


            setTimeout(() => {
                popup.style.opacity = 0;
                setTimeout(() => {
                    popup.style.visibility = 'hidden';
                }, 600);
            }, 3000);
        }


        function validInputs(event) {

            const name = document.getElementById('username').value;
            const password = document.getElementById('password').value;

            if (name) {
                if (name.length < 4) {
                    showPopup("Username too short!", 'red', 'popupNameText');
                    return false;
                }
            } else {
                showPopup("Username is not set!", 'red', 'popupNameText');
                return false;
            }


            if (password) {
                if (password.length >= 7) {
                    if (!/[a-z]/.test(password)) {
                        showPopup("Password needs to contain a lowercase letter.", 'red', 'popupPasswordText');
                        window.scrollTo({ top: 0, behavior: 'smooth' });
                        return false;
                    }
                    if (!/[A-Z]/.test(password)) {
                        showPopup("Password needs to contain an uppercase letter.", 'red', 'popupPasswordText');
                        window.scrollTo({ top: 0, behavior: 'smooth' });
                        return false;
                    }
                    if (!/[0-9]/.test(password)) {
                        showPopup("Password needs to contain a number.", 'red', 'popupPasswordText');
                        window.scrollTo({ top: 0, behavior: 'smooth' });
                        return false;
                    }
                } else {
                    showPopup("Password must be at least 7 characters long.", 'red', 'popupPasswordText');
                    window.scrollTo({ top: 0, behavior: 'smooth' });
                    return false;
                }
            } else {
                showPopup("Password is not set!", 'red', 'popupPasswordText');
                window.scrollTo({ top: 0, behavior: 'smooth' });
                return false;
            }


            return true;
        }



        function togglePasswordVisibility() {
            const passwordField = document.getElementById('password');
            const confirmPasswordField = document.getElementById('confirmPassword');
            const showPasswordCheckbox = document.getElementById('showPassword');

            if (showPasswordCheckbox.checked) {
                passwordField.type = 'text';
                confirmPasswordField.type = 'text';
            } else {
                passwordField.type = 'password';
                confirmPasswordField.type = 'password';
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

            <!-- Reset button -->
            <button type="reset" class="reset-button">Reset</button>

            <!-- Submit button -->
            <asp:Button ID="btnSubmit" CssClass="login-button" runat="server" Text="Login" 
                OnClientClick="return validInputs(event); return false" OnClick="Submit" ClientIDMode="Static" />

            <!-- Register button -->
            <a href="Register.aspx" class="create-account">Create New Account</a> 


        </form> 
    </div>


    <div class="popup-text" id="popupText"></div>


</asp:Content>
