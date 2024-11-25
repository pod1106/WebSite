
<%@ Page Title="Admin - User List" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="website.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Admin - User List</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Form needs to be inside ContentPlaceHolder -->
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="UserGridView" runat="server" AutoGenerateColumns="true" />
        </div>
    </form>
</asp:Content>
