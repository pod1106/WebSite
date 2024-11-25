using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SQLite;

namespace website
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load users into the GridView
                LoadUsers();
            }
        }

        private void LoadUsers()
        {
            // Get the absolute path to the database file inside the DataBase folder
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

                    // Bind the data to the GridView
                    UserGridView.DataSource = reader;
                    UserGridView.DataBind();
                }
                catch (Exception ex)
                {
                    // Display an error message if something goes wrong
                    Response.Write("Error: " + ex.Message);
                }
            }
        }
    }
}
