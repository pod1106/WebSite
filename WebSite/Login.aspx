<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="website.Login" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-container {
             width: 800px;
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

        @media (max-width: 1000px) {
            .form-container {
            width: 80%; /* Set to 80% when window is less than 1000px */
            }
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
            margin-bottom: 20px; 
            border: 1px solid #ccc; 
            border-radius: 6px; 
            font-size: 18px;
            text-align: left;
        }


        .form-container .send-button {
            width: 100px; 
            padding: 12px; 
            font-weight: bold;
            background-color: #35c2dc; 
            color: white; 
            font-size: 24px;
            margin: 20px;
            border: none; 
            border-radius: 4px; 
            text-align: center;

            cursor: pointer; 
            transition: background-color 0.3s ease;
        }

        .form-container button:hover {
            background-color: #14a8e6;
        }



        .tooltip-text {
            visibility: hidden;   
            opacity: 0;

            width: 300px;           /* window width */
            color: #6f816fff;            /* text color */
            font-size: 18px;        /* text size */
            background-color: #dcfed7ee; /* window color */
            border: 2px solid #abd4abff; /* boarder width, type and color */
            border-radius: 8px;     /* boarder radius */
             
            text-align: center;     /* text possition in window */
            padding: 10px;          /* in window padding */
            
            position: absolute;     /* window possition */
            right: 105%;            /* window possition relative to the label */
            top: -10px;

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
            font-size: 18px;
            text-align: center;
    
            visibility: hidden;
            opacity: 0;
            position: absolute;  /* Positioning the popup relative to the label */
            width: 300px;        /* Adjust the width of the popup */

            top: 30px;              /* Align with the top of the label */
            left: 103%;          /* Place the popup to the right of the label */
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


.gender-options label {
    display: inline-block;
    margin-right: 4px;
    background-color: rgba(0, 0, 0, 0.05);
    width: 120px;
    padding: 5px;
    border: 2px solid rgba(100, 100, 100, 0.8);
    border-radius: 8px;
    text-align: center;
    cursor: pointer; 
}

.gender-window {
    border: 2px solid rgba(50, 50, 50, 0.8);
    border-radius: 8px;
    padding-top: 10px;
    padding-bottom: 10px;
    position: relative;
    margin-bottom: 10px;
    background-color: white;
}









    </style>


    <script>
        window.onbeforeunload = null; 


        function showPopup(message, theme = 'red', targetId) {
            const popup = document.getElementById(targetId);
            popup.innerText = message;

            // Remove the old theme class (if any) and add the new theme class
            popup.classList.remove('red-popup', 'green-popup');
            if (theme === 'green') {
                popup.classList.add('green-popup');
            } else {
                popup.classList.add('red-popup');
            }

            popup.style.visibility = 'visible';
            popup.style.opacity = 1;

            // Optional: Automatically hide the popup after 3 seconds
            setTimeout(() => {
                popup.style.opacity = 0; // Fade out the popup (opacity)

                setTimeout(() => {
                    popup.style.visibility = 'hidden';
                }, 600);
            }, 3000);
        }

        function validInputs(even) {
            const name = document.getElementById('username').value;
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value; 
            const male = document.getElementById('male').checked;
            const female = document.getElementById('female').checked;
            const other = document.getElementById('other').checked;

            
            let gender = 0;


            if (male === true) {
                gender = "male";
            } else if (female === true) {
                gender = "female";
            } else if (other === true) {
                gender = "other";
            }




            if (name) {
                if (name.length < 4) {
                    showPopup("Username has to be at least 4 characters!", 'red', 'popupNameText');
                    return false;
                }
            } else {
                showPopup("Username is not set!", 'red', 'popupNameText');
                return false;
            }

            if (email) {
                const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                if (!emailRegex.test(email)) {
                    showPopup("Email is not valid!", 'red', 'popupEmailText');
                    return false;
                }
            } else {
                showPopup("Email is not set!", 'red', 'popupEmailText');
                return false;
            }

            if (password) {
                if (password.length >= 7) {
                    if (!/[a-z]/.test(password)) {
                        showPopup("Password needs to contain a lowercase letter.", 'red', 'popupPasswordText');
                        return false;
                    }
                    if (!/[A-Z]/.test(password)) {
                        showPopup("Password needs to contain an uppercase letter.", 'red', 'popupPasswordText');
                        return false;
                    }
                    if (!/[0-9]/.test(password)) {
                        showPopup("Password needs to contain a number.", 'red', 'popupPasswordText');
                        return false;
                    }
                } else {
                    showPopup("Password must be at least 7 characters long.", 'red', 'popupPasswordText');
                    return false;
                }
            } else {
                showPopup("Password is not set!", 'red', 'popupPasswordText');
                return false;
            }

            if (confirmPassword) {
                if (password !== confirmPassword) {
                    showPopup("Passwords must be the same", "red", "popupConfirmPasswordText");
                    return false;
                }
            } else {
                showPopup("must Confirm the password", "red", "popupConfirmPasswordText");
                return false;
            }


            if (!gender) {
                showPopup("Please select a gender", "red", "popupGender");
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

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <div class="form-container" runat="server">
        <form autocomplete="off" runat="server">
            <!-- Username Field -->
            <label for="name">User Name
                <span class="tooltip-text">Username must be at least 4 characters</span>
                <span class="popup-text" id="popupNameText"></span>
            </label>
            <input type="text" id="username" name="username" placeholder="Enter your username" autocomplete="off" />


            <!-- Email Field -->
            <label for="email">Email
                <span class="popup-text" id="popupEmailText"></span> 
            </label>
            <input type="text" id="email" name="email" placeholder="Enter your email" autocomplete="off" />


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

            <!-- Confirm Password Field -->
            <label for="confirm-password">Confirm Password
                <span class="tooltip-text">Password must be at least 7 characters long, and contain a mix of upper and lowercase letters, and numbers.</span>
                <span class="popup-text" id="popupConfirmPasswordText"></span>
            </label>
            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm password" autocomplete="off" />


            <!-- Gender Selection -->
            <div class="gender-window">
                <label style="text-align: center;">Gender
                    <span class="popup-text" id="popupGender"></span>
                </label>

                <div class="gender-options">
                    <label>
                        <input type="radio" id="male" name="gender" value="Male" />
                        Male
                    </label>

                    <label>
                        <input type="radio" id="female" name="gender" value="Female" />
                        Female
                    </label>

                    <label>
                        <input type="radio" id="other" name="gender" value="Other" />
                        Other
                    </label>
                </div>
            </div>

           



            <!-- Interest Slider -->
            <div>
                <label for="interest-level" style="margin-top: 30px;">Rate your interest in learning about the 7 Wonders <br>(1 - Not Interested, 10 - Very Interested)
                    <span class="tooltip-text">Use the slider to indicate your interest.</span>
                </label>

                <input style="width: 80%; display: block; margin: 0 auto;" type="range" id="interest-level" name="interest-level" min="1" max="10" value="5"
                    oninput="document.getElementById('interestOutput').value = this.value; document.getElementById('sliderValueHidden').value = this.value;">

                <input type="text" id="interestOutput" name="interestOutput" value="5" readonly 
                       style="display: block; margin: 0px auto; margin-bottom: 30px; border: 1px solid black; padding: 5px; border-radius: 4px; font-size: 35px; width: 60px; text-align: center;" />

                <input type="hidden" id="sliderValueHidden" name="sliderValueHidden" />
            </div>


             <label for="favorite-wonder">Which of the 7 Wonders fascinates you the most? Tell us why!
                <span class="tooltip-text">Share your thoughts about your favorite Wonder.</span>
            </label>

            <textarea id="favoriteWonder" name="favoriteWonder" placeholder="Write your thoughts here..." 
                      style="margin-right: 20px; resize: none; width: 95%; height: 100px; font-size: 18px;" rows="4" cols="50"></textarea>



            <!-- Submit Button -->
            <asp:Button ID="btnSubmit" CssClass="send-button" runat="server" Text="Send" 
                OnClientClick="return validInputs(event); return false" OnClick="Submit" ClientIDMode="Static"/>




            <asp:Label ID="resultLabel" runat="server" 
               Text="" 
               Style="font-size: 18px; color: blue;" />
            
        </form>

         
    </div>
    <div class="popup-text" id="popupText"></div>
    
    

</asp:Content>


