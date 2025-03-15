using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SQLite;
using System.Data;


namespace website
{
    public partial class Admin : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUsers();
            }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (ValidateUser(username, password))
            {
                Session["LoggedInUser"] = username; // Store user in session
                pnlAdminSection.Visible = true;    // Show admin panel
                lblLoginError.Visible = false;     // Hide error message
                LoginSection.Visible = false;      // Hide login section
            }
            else
            {
                lblLoginError.Visible = true;      // Show error if login fails
            }
        }

        // Validate user from the database
        private bool ValidateUser(string username, string password)
        {
            string dbPath = Server.MapPath("~/DataBase/database.sqlite");
            string connectionString = $"Data Source={dbPath};Version=3;";

            using (SQLiteConnection conn = new SQLiteConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT COUNT(*) FROM Admins WHERE Username = @Username AND Password = @Password";
                using (SQLiteCommand cmd = new SQLiteCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);
                    int count = Convert.ToInt32(cmd.ExecuteScalar());
                    return count > 0; // Return true if user exists
                }
            }
        }



        private void LoadUsers(string usernameFilter = "", string emailFilter = "")
        {
            string dbPath = Server.MapPath("~/DataBase/database.sqlite");
            string connectionString = $"Data Source={dbPath};Version=3;";

            using (SQLiteConnection conn = new SQLiteConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT Username, Password, Email, IFNULL(Gender, 'null') AS Gender FROM Users WHERE Username LIKE @Username AND Email LIKE @Email";
                using (SQLiteCommand cmd = new SQLiteCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", "%" + usernameFilter + "%");
                    cmd.Parameters.AddWithValue("@Email", "%" + emailFilter + "%");
                    using (SQLiteDataAdapter da = new SQLiteDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        gvUsers.DataSource = dt;
                        gvUsers.DataBind();
                    }
                }
            }
        }

        protected void gvUsers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvUsers.EditIndex = e.NewEditIndex;
            LoadUsers(txtSearchUsername.Text, txtSearchEmail.Text);
        }

        protected void gvUsers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvUsers.Rows[e.RowIndex];
            string username = gvUsers.DataKeys[e.RowIndex].Values[0].ToString();
            string password = ((TextBox)row.Cells[1].Controls[0]).Text;
            string email = ((TextBox)row.Cells[2].Controls[0]).Text;
            string gender = ((DropDownList)row.Cells[3].FindControl("ddlGender")).SelectedValue;

            if (gender == "null") gender = null;

            string dbPath = Server.MapPath("~/DataBase/database.sqlite");
            string connectionString = $"Data Source={dbPath};Version=3;";

            using (SQLiteConnection conn = new SQLiteConnection(connectionString))
            {
                conn.Open();
                string query = "UPDATE Users SET Password = @Password, Email = @Email, Gender = @Gender WHERE Username = @Username";
                using (SQLiteCommand cmd = new SQLiteCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Password", password);
                    cmd.Parameters.AddWithValue("@Email", email);
                    if (gender != null)
                        cmd.Parameters.AddWithValue("@Gender", gender);
                    else
                        cmd.Parameters.AddWithValue("@Gender", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.ExecuteNonQuery();
                }
            }

            gvUsers.EditIndex = -1;
            LoadUsers(txtSearchUsername.Text, txtSearchEmail.Text);
        }

        protected void gvUsers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvUsers.EditIndex = -1;
            LoadUsers(txtSearchUsername.Text, txtSearchEmail.Text);
        }

        protected void gvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string username = gvUsers.DataKeys[e.RowIndex].Values[0].ToString();

            string dbPath = Server.MapPath("~/DataBase/database.sqlite");
            string connectionString = $"Data Source={dbPath};Version=3;";

            using (SQLiteConnection conn = new SQLiteConnection(connectionString))
            {
                conn.Open();
                string query = "DELETE FROM Users WHERE Username = @Username";
                using (SQLiteCommand cmd = new SQLiteCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.ExecuteNonQuery();
                }
            }

            LoadUsers(txtSearchUsername.Text, txtSearchEmail.Text);
        }

        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            string username = txtNewUsername.Text.Trim();
            string password = txtNewPassword.Text.Trim();
            string email = txtNewEmail.Text.Trim();
            string gender = ddlNewGender.SelectedValue;

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(email))
            {
                // Add validation message here if needed
                return;
            }

            string dbPath = Server.MapPath("~/DataBase/database.sqlite");
            string connectionString = $"Data Source={dbPath};Version=3;";

            using (SQLiteConnection conn = new SQLiteConnection(connectionString))
            {
                conn.Open();
                string query = "INSERT INTO Users (Username, Password, Email, Gender) VALUES (@Username, @Password, @Email, @Gender)";
                using (SQLiteCommand cmd = new SQLiteCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);
                    cmd.Parameters.AddWithValue("@Email", email);
                    if (!string.IsNullOrEmpty(gender))
                        cmd.Parameters.AddWithValue("@Gender", gender);
                    else
                        cmd.Parameters.AddWithValue("@Gender", DBNull.Value);
                    cmd.ExecuteNonQuery();
                }
            }

            // Clear the input fields
            txtNewUsername.Text = "";
            txtNewPassword.Text = "";
            txtNewEmail.Text = "";
            ddlNewGender.SelectedIndex = 0;

            LoadUsers(txtSearchUsername.Text, txtSearchEmail.Text);
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadUsers(txtSearchUsername.Text, txtSearchEmail.Text);
        }

        protected void btnClearSearch_Click(object sender, EventArgs e)
        {
            txtSearchUsername.Text = "";
            txtSearchEmail.Text = "";
            LoadUsers();
        }

        protected void gvUsers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowState.HasFlag(DataControlRowState.Edit))
            {
                DropDownList ddlGender = (DropDownList)e.Row.FindControl("ddlGender");
                string gender = DataBinder.Eval(e.Row.DataItem, "Gender").ToString();

                if (ddlGender != null)
                {
                    ddlGender.SelectedValue = string.IsNullOrEmpty(gender) ? "null" : gender;
                }
            }
        }
    }
}
