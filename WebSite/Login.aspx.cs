using System;
using System.Data.SQLite;
using System.Web.UI;

namespace website
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Handle any logic you might need on page load
        }


        private string FetchUsersFromDatabase()
        {
            // Connection string to SQLite database
            string dbPath = Server.MapPath("~/DataBase/database.sqlite");
            string connectionString = $"Data Source={dbPath};Version=3;";

            using (SQLiteConnection conn = new SQLiteConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    // Query to fetch all users from the Users table
                    string query = "SELECT Id, Username, Email, Gender FROM Users";
                    SQLiteCommand cmd = new SQLiteCommand(query, conn);
                    SQLiteDataReader reader = cmd.ExecuteReader();

                    string result = "Users in Database:<br><br>";

                    // Read through the results and display them
                    while (reader.Read())
                    {
                        result += $"Id: {reader["Id"]}, Username: {reader["Username"]}, Email: {reader["Email"]}, Gender: {reader["Gender"]}<br>";
                    }

                    return result;  // Return the result to display in the UI
                }
                catch (Exception ex)
                {
                    // In case of any error, display the error message
                    return "Error: " + ex.Message;
                }
            }
        }
    }
}
