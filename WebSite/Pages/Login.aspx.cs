using System;
using System.Data.SQLite;
using System.Web.UI;

namespace website
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Submit(object sender, EventArgs e)
        {
            string username = Request.Form["username"];
            string password = Request.Form["password"];

            bool isUserValid = CheckUserInDatabase(username, password);

            if (isUserValid)
            {
                Session["Username"] = username;

                string returnUrl = Request.QueryString["ReturnUrl"];

                if (!string.IsNullOrEmpty(returnUrl))
                {
                    Response.Redirect(returnUrl);
                }
                else
                {
                    Response.Redirect("Home.aspx");
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "InvalidLogin",
                    "window.onload = function() { showPopup('Invalid Username or Password', 'red2', 'popupText'); };", true);

                KeepFormData(username, password);
            }

        }

        private bool CheckUserInDatabase(string username, string password)
        {
            string dbPath = Server.MapPath("~/DataBase/database.sqlite");
            bool userExists = false;

            using (SQLiteConnection conn = new SQLiteConnection("Data Source=" + dbPath))
            {
                conn.Open();

                string query = "SELECT COUNT(1) FROM Users WHERE username = @username AND password = @password";
                using (SQLiteCommand cmd = new SQLiteCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@username", username);
                    cmd.Parameters.AddWithValue("@password", password);

                    userExists = Convert.ToInt32(cmd.ExecuteScalar()) > 0;
                }
            }

            return userExists;
        }


        private void KeepFormData(string username, string password)
        {
            string keepFormDataScript = $@"

        document.getElementById('username').value = '{username}';
        document.getElementById('password').value = '{password}';";

            ClientScript.RegisterStartupScript(this.GetType(), "KeepFormData", keepFormDataScript, true);
        }
    }
}
