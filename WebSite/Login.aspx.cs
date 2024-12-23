using System;
using System.Data.SQLite;
using System.Diagnostics;
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
            string wonder = Request.Form["wonder"];


            if (!string.IsNullOrEmpty(gender))
            {
                gender = gender.ToLower().Trim();
            }


            if (ValidateInputs(username, email, password, confirmPassword, gender))
            {
                string CheckUser = CheckUserExistence(username, email);


                if (CheckUser == null) {

                    resultLabel.Text = "all good!";


                } else {

                    resultLabel.Text = "this " + CheckUser + " is already been used";

                    string script = $"window.onload = function() {{ showPopup('This {wonder} has already been used', 'red2', 'popupText'); }};";
                    ClientScript.RegisterStartupScript(this.GetType(), "ErrorAlert", script, true);

                }

            }
            else
            {
                resultLabel.Text = "something is wrong";
            }
            KeepFormData(username, email, password, confirmPassword, gender, sliderValue, text);

        }

        private string CheckUserExistence(string name, string email)
        {
            string dbPath = Server.MapPath("~/DataBase/database.sqlite");
            string connectionString = $"Data Source={dbPath};Version=3;";

            using (SQLiteConnection conn = new SQLiteConnection(connectionString))
            {
                conn.Open();


                string query = "SELECT COUNT(1) FROM Users WHERE Username = @name";
                using (SQLiteCommand cmd = new SQLiteCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@name", name);
                    int count = Convert.ToInt32(cmd.ExecuteScalar());
                    if (count > 0) { return "username"; }
                }

                query = "SELECT COUNT(1) FROM Users WHERE Email = @email";
                using (SQLiteCommand cmd = new SQLiteCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@email", email);
                    int count = Convert.ToInt32(cmd.ExecuteScalar());
                    if (count > 0) { return "email"; }
                }
            }
            return null;
        }

        private bool ValidateInputs(string name, string email, string password, string confirmPassword, string gender)
        {
            return true;
            if (string.IsNullOrEmpty(name) || name.Length < 4)
            {
                return false; // Invalid name
            }

            if (string.IsNullOrEmpty(email) || !Regex.IsMatch(email, "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$"))
            {
                return false; // Invalid email
            }


            if (string.IsNullOrEmpty(password) ||
                password.Length < 7 ||
                !Regex.IsMatch(password, "[a-z]") ||
                !Regex.IsMatch(password, "[A-Z]") ||
                !Regex.IsMatch(password, "[0-9]"))
            {
                return false;
            }



            return true;
        }



        private void KeepFormData(string username, string email, string password, string confirmPassword, string gender, string sliderValue, string text)
        {
            string keepFormDataScript = $@"
        // Keep the form data
        document.getElementById('username').value = '{username}';
        document.getElementById('email').value = '{email}';
        document.getElementById('password').value = '{password}';
        document.getElementById('confirmPassword').value = '{confirmPassword}';
        document.getElementById('interest-level').value = '{sliderValue}';
        document.getElementById('interestOutput').value = '{sliderValue}';
        document.getElementById('sliderValueHidden').value = '{sliderValue}';
        document.getElementById('favoriteWonder').value = '{text}';

        // Set the gender radio buttons
        if ('{gender}' === 'male') {{
            document.getElementById('male').checked = true;
        }} else if ('{gender}' === 'female') {{
            document.getElementById('female').checked = true;
        }} else if ('{gender}' === 'other') {{
            document.getElementById('other').checked = true;
        }}

        // Set the wonder dropdown value
        document.getElementById('wonders').value = '{Request.Form["wonder"]}';
    ";

            // Execute the script to re-fill the form fields with the values entered by the user
            ClientScript.RegisterStartupScript(this.GetType(), "KeepFormData", keepFormDataScript, true);
        }


    }
}
