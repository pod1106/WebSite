<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MyMaster.Master" CodeBehind="Form.aspx.vb" Inherits="WebSite.Form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="form-container">
        <form>
            <label for="name">שם:</label>
            <input type="text" id="name" name="name"  />

            <label for="email">אימייל:</label>
            <input type="email" id="email" name="email"  />

            <label for="message">סיסמה:</label>
            <input id="password" name="message"  />

            <button type="submit">שלח</button>
        </form>
    </div>


    <style>
        .form-container {
            width: 400px; 
            height: 400px; 
            border: 2px solid black; 
            padding: 10px;
            background-color: #f9f9f9;
        }

        .form-container label {
            margin-bottom: 10px;
        }

        .form-container input,
        .form-container textarea {
            width: 95%;
            padding: 8px;
            margin-bottom: 15px;

        }

        .form-container button {
            padding: 10px 20px;
            background-color: rgb(87 228 254);
            color: white;
            border: none;
            cursor: pointer;
            align-self: center; 
        }

        .form-container button:hover {
            background-color: rgb(21 185 247);
        }
    </style>
</asp:Content>
