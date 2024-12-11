using System;
using System.Data.SQLite;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Xml.Linq;

namespace website
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
            // Handle any logic you might need on page load
        }

        protected void Submit(object sender, EventArgs e)
        {
            string username = Request.Form["username"];
            string email = Request.Form["email"];
            string password = Request.Form["password"];
            string confirmPassword = Request.Form["confirmPassword"];
            string gender = Request.Form["gender"];
            string sliderValue = Request.Form["interestOutput"];
            string text = Request.Form["favoriteWonder"];


            if (!string.IsNullOrEmpty(gender))
            {
                gender = gender.ToLower().Trim();
            }


            //if (ValidateInputs(username, email, password, confirmPassword, gender)) {
            //    resultLabel.Text = "all good!";
            //} else
            //{
            //    resultLabel.Text = "something is wrong";
            //}




        }

        private bool ValidateInputs(string name, string email, string password, string confirmPassword, string gender)
        {
            if (string.IsNullOrEmpty(name) || name.Length < 4)
            {
                return false; // Invalid name
            }

            if (string.IsNullOrEmpty(email) || !Regex.IsMatch(email, @"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"))
            {
                return false; // Invalid email
            }


            if (string.IsNullOrEmpty(password) || password.Length < 7)
            {
                return false; 
            }
            if (!Regex.IsMatch(password, @"[a-z]")) 
            {
                return false;
            }
            if (!Regex.IsMatch(password, @"[A-Z]")) 
            {
                return false;
            }
            if (!Regex.IsMatch(password, @"[0-9]")) 
            {
                return false;
            }


            if (password != confirmPassword)
            {
                return false; 
            }


            if (string.IsNullOrEmpty(gender))
            {
                return false;
            }

            return true;
        }
    }
}
