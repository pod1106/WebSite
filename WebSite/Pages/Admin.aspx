<%@ Page Title="Admin" Language="C#" MasterPageFile="~/MasterPages/MyMaster.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="website.Admin" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .admin-container {
            margin: 20px;
            padding: 20px;
            border: 3px solid black;
            border-radius: 6px;
            background-color: rgb(240, 240, 240);

        }

        .admin-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
            background-color: rgb(225, 254, 152);
        }

        .admin-table th, .admin-table td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }

        .admin-table th {
            background-color: #f2f2f2;
        }


        .admin-table tr:hover {
            background-color: rgb(210, 240, 145);
        }

        .add-user-form {
            margin-top: 20px;
        }

        .add-user-form input, .add-user-form select {
            margin-bottom: 10px;
            padding: 8px;
            width: 100%;
            max-width: 200px;
            box-sizing: border-box;
            font-size: 20px;
        }

        .add-user-form button {
            padding: 10px 20px;
            background-color: #5cb85c;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .add-user-form button:hover {
            background-color: #4cae4c;
        }

        .search-form {
            margin-bottom: 20px;
        }

        .search-form input {
            padding: 8px;
            margin-right: 10px;
            max-width: 250px;
        }

        .search-form button {
            padding: 8px 20px;
        }

        input {
            padding: 2px;
            max-width: 300px;
            font-size: 16px;
        }

        .main-input {
            margin-bottom: 10px;
            padding: 8px;
            width: 100%;
            max-width: 200px;
            box-sizing: border-box;
            font-size: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<form id="form1" runat="server">
    <asp:Panel ID="LoginSection" runat="server">
        <div class="login-section" style="margin: 50px; background-color: rgb(220, 220, 220); padding: 20px;">
            <h2>Admin Login</h2>
            <asp:TextBox ID="txtUsername" runat="server" placeholder="Enter Username"></asp:TextBox>
            <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="Login_Click" />
            <asp:Label ID="LoginError" runat="server" ForeColor="Red" Visible="false" Text="Invalid credentials."></asp:Label>
        </div>
    </asp:Panel>

    <asp:Panel ID="Users" runat="server" Visible="false">
        <div class="admin-container">
            <h2>Admin - User Management</h2>
            <div class="search-form">
                <asp:TextBox ID="txtSearchUsername" runat="server" placeholder="Search by Username" CssClass="main-input"></asp:TextBox>
                <asp:TextBox ID="txtSearchEmail" runat="server" placeholder="Search by Email" CssClass="main-input"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="Search_Click" CssClass="main-input"/>
                <asp:Button ID="btnClearSearch" runat="server" Text="Clear" OnClick="ClearSearch_Click" CssClass="main-input"/>
            </div>
            <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" CssClass="admin-table" DataKeyNames="Username" OnRowEditing="User_Editing" OnRowUpdating="User_Updating" OnRowCancelingEdit="User_CancelingEdit" OnRowDeleting="User_Deleting" OnRowDataBound="User_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" />
                    <asp:BoundField DataField="Password" HeaderText="Password" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:TemplateField HeaderText="Gender">
                        <ItemTemplate>
                            <%# Eval("Gender") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlGender" runat="server">
                                <asp:ListItem Text="MALE" Value="MALE" />
                                <asp:ListItem Text="FEMALE" Value="FEMALE" />
                                <asp:ListItem Text="null" Value="null" />
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>

            <div class="add-user-form">
                <h3>Add New User</h3>
                <asp:TextBox ID="txtNewUsername" runat="server" placeholder="Username"></asp:TextBox>
                <asp:TextBox ID="txtNewPassword" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                <asp:TextBox ID="txtNewEmail" runat="server" placeholder="Email"></asp:TextBox>
                <asp:DropDownList ID="ddlNewGender" runat="server">
                    <asp:ListItem Text="Select Gender" Value="" />
                    <asp:ListItem Text="MALE" Value="MALE" />
                    <asp:ListItem Text="FEMALE" Value="FEMALE" />
                </asp:DropDownList>
                <asp:Button ID="btnAddUser" runat="server" Text="Add User" OnClick="AddUser_Click" CssClass="add-user-button" />
            </div>
        </div>
    </asp:Panel>

    <div style="height: 50px;" > </div>

    <asp:Panel ID="QuizResults" runat="server" Visible="false">
        <div class="admin-container">
            <h2>Admin - Quiz Management</h2>
            <div class="search-form">
                <asp:TextBox ID="TextBox1" runat="server" placeholder="Search by Username" CssClass="main-input"></asp:TextBox>
                <asp:TextBox ID="TextBox2" runat="server" placeholder="Search by Score" CssClass="main-input"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Search" OnClick="SearchQuizResults_Click" CssClass="main-input"/>
                <asp:Button ID="Button2" runat="server" Text="Clear" OnClick="ClearQuizResultsSearch_Click" CssClass="main-input"/>
            </div>
            <asp:GridView ID="gvQuizResults" runat="server" AutoGenerateColumns="False" CssClass="admin-table">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" />
                    <asp:BoundField DataField="Score" HeaderText="Score" />
                </Columns>
            </asp:GridView>
        </div>
    </asp:Panel>

    <div style="height: 200px"></div>


</form>
</asp:Content>