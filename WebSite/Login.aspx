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
        }
        .gender-options label {
            display: inline-block; /* Align the labels horizontally */
            margin-right: 4px; /* Adds some space between options */
            background-color: rgba(0, 0, 0, 0.05);
            width: 120px;
            padding: 5px;
            border: 2px solid rgba(100, 100, 100, 0.8);
            border-radius: 8px;
            text-align: center;
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
            }, 3000); // Hide after 3 seconds (adjust as needed)
        }

        function validInputs() {
            const name = document.getElementById('name').value;
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirm-password').value;
            const gender = document.querySelector('input[name="gender"]:checked');

            console.log(gender);

            showPopup("New account was created!", "green", 'popupText');
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

            if (confirmPassword) {
                if (password !== confirmPassword) {
                    showPopup("Passwords must be the same", "red", "popupConfirmPasswordText");
                    return;
                }
            } else {
                showPopup("must Confirm the password", "red", "popupConfirmPasswordText");
                return;
            }


            if (!gender) {
                showPopup("Please select a gender", "red", "popupGender");
                return;
            }

            console.log("username: " + name + "\nemail: " + email + "\npassword: " + password + "\ngender: " + gender.id);
            showPopup("New account was created!", "green", 'popupText');

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
            <!-- Username Field -->
            <label for="name">User Name
                <span class="tooltip-text">Username must be at least 4 characters</span>
                <span class="popup-text" id="popupNameText"></span>
            </label>
            <input type="text" id="name" name="name" placeholder="Enter your username" required autocomplete="off" />

            <!-- Email Field -->
            <label for="email">Email
                <span class="popup-text" id="popupEmailText"></span> 
            </label>
            <input type="text" id="email" name="email" placeholder="Enter your email" required autocomplete="off" />

            <!-- Password Field -->
            <label for="password">Password
                <span class="tooltip-text">Password must be at least 7 characters long, and contain a mix of upper and lowercase letters, and numbers.</span>
                <span class="popup-text" id="popupPasswordText"></span>
            </label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required autocomplete="off" />

            <!-- Confirm Password Field -->
            <label for="confirm-password">Confirm Password
                <span class="tooltip-text">Password must be at least 7 characters long, and contain a mix of upper and lowercase letters, and numbers.</span>
                <span class="popup-text" id="popupConfirmPasswordText"></span>
            </label>
            <input type="password" id="confirm-password" name="password" placeholder="Confirm password" required autocomplete="off" />

            <!-- Gender Selection -->
            <div style="border: 2px solid rgba(50, 50, 50, 0.8); border-radius: 8px; padding: 10px; position: relative; right: 10px; margin-bottom: 10px; background-color: white;">
                <label for="gender" style="text-align: center;">Gender
                    <span class="popup-text" id="popupGender"></span>
                </label>
                <div class="gender-options">
                    <label>
                        <input type="radio" id="male" name="gender" value="Male" required>
                        Male
                    </label>
                    <label>
                        <input type="radio" id="female" name="gender" value="Female">
                        Female
                    </label>
                    <label>
                        <input type="radio" id="Other" name="gender" value="Not-Say">
                        Other
                    </label>
                </div>
            </div>
           

            <!-- Interest Slider -->
            <div>
                <label for="interest-level" style="margin-top: 30px;">Rate your interest in learning about the 7 Wonders (1 - Not Interested, 10 - Very Interested)
                    <span class="tooltip-text">Use the slider to indicate your interest.</span>
                </label>
                <input style="width: 200px;" type="range" id="interest-level" name="interest-level" min="1" max="10" value="5" oninput="document.getElementById('interest-output').value = this.value">
                <output id="interest-output" style="border: 1px solid black; padding: 5px; border-radius: 4px; font-size: 35px;">5</output>

            </div>
             <label for="favorite-wonder">Which of the 7 Wonders fascinates you the most? Tell us why!
                 <span class="tooltip-text">Share your thoughts about your favorite Wonder.</span>
             </label>
             <textarea id="favorite-wonder" name="favorite-wonder" rows="4" cols="50" placeholder="Write your thoughts here..." style="margin-right: 20px; resize: none; width: 450px; height: 100px;"></textarea>

            <!-- Submit Button -->
            <button type="button">Send</button>
        </form>

       <div class="popup-text" id="popupText" style="position: relative;">
       </div>
    </div>
</asp:Content>
