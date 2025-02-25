using System;
using System.Data.SQLite;
using System.Diagnostics;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Xml.Linq;



namespace website
{
    public partial class Register : System.Web.UI.Page
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

            gender.ToLower().Trim();
            if (gender == "Male")
            {
                gender = "MALE";
            }
            else if (gender == "Female")
            {
                gender = "FEMALE";
            }
            else
            {
                gender = "null";
            }




            string CheckUser = CheckUserExistence(username, email);

            if (!(CheckUser == null)) {

                string script = $"window.onload = function() {{ showPopup('This {CheckUser} has already been used', 'red2', 'popupText', 6000); }};";

                ClientScript.RegisterStartupScript(this.GetType(), "ErrorAlert", script, true);
                KeepFormData(username, email, password, confirmPassword, gender, sliderValue, text);
                return;
            }

            if (AddNewUser(username, email, password, gender)) {

                System.Threading.Thread.Sleep(1000);

                Session["Username"] = username;
                Response.Redirect("Home.aspx");

                return;


            } else
            {
                string script = $"window.onload = function() {{ showPopup('Please try again', 'red2', 'popupText', 6000); }};";

                ClientScript.RegisterStartupScript(this.GetType(), "ErrorAlert", script, true);
                KeepFormData(username, email, password, confirmPassword, gender, sliderValue, text);
            }



        }


        private string CheckUserExistence(string name, string email)
        {
            string dbPath = Server.MapPath("~/DataBase/database.sqlite");
            string connectionString = $"Data Source={dbPath};Version=3;";

            using (SQLiteConnection conn = new SQLiteConnection(connectionString))
            {
                conn.Open();


                string query = "SELECT COUNT(*) FROM Users WHERE Username = @name"; // check is username is in use
                using (SQLiteCommand cmd = new SQLiteCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@name", name);
                    int count = Convert.ToInt32(cmd.ExecuteScalar());
                    if (count > 0) { return "username"; }
                }

                query = "SELECT COUNT(*) FROM Users WHERE Email = @email";
                using (SQLiteCommand cmd = new SQLiteCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@email", email);
                    int count = Convert.ToInt32(cmd.ExecuteScalar());
                    if (count > 0) { return "email"; }
                }
            }
            return null;
        }

        private bool AddNewUser(string username, string email, string password, string gender)
        {
            string dbPath = Server.MapPath("~/DataBase/database.sqlite");
            string connectionString = $"Data Source={dbPath};Version=3;";

            using (SQLiteConnection conn = new SQLiteConnection(connectionString))
            {
                conn.Open();
                
                string query = "INSERT INTO Users (Username, Email, Password, Gender, Permission) VALUES (@username, @email, @password, @gender, '')";

                using (SQLiteCommand cmd = new SQLiteCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@username", username);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@password", password);
                    cmd.Parameters.AddWithValue("@gender", gender);


                    cmd.ExecuteNonQuery();
                    return true; 

                }
            }
        }



        private void KeepFormData(string username, string email, string password, string confirmPassword, string gender, string sliderValue, string text)
        {
            string keepFormDataScript = $@"
        
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

        document.getElementById('wonders').value = '{Request.Form["wonder"]}';";

            // Execute the script to re-fill the form fields with the values entered by the user
            ClientScript.RegisterStartupScript(this.GetType(), "KeepFormData", keepFormDataScript, true);
        }


    }
}
