<%@ Page Title="Leaderboard" Language="C#" MasterPageFile="~/MasterPages/MyMaster.Master" AutoEventWireup="true" CodeBehind="Leaderboard.aspx.cs" Inherits="website.Pages.Leaderboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .leaderboard-container {
            width: 70%;
            margin: 50px auto;
            padding: 20px;
            border: 2px solid black;
            background-color: rgb(171, 219, 255);
            border-radius: 8px;
            text-align: center;
            font-size: 28px;
        }
        .leaderboard-table {
            width: 100%;
            border-collapse: collapse;
        }
        .leaderboard-table th, .leaderboard-table td {
            padding: 10px;
            border: 1px solid black;
            background-color: rgb(243, 255, 189);
        }
        .leaderboard-table th {
            background-color: rgb(220, 255, 160);
        }
    </style>

    <script>
        var username = '<%= Session["Username"] %>';
        if (username === "") {
            window.location.href = 'NoAccessQuiz.aspx?ReturnUrl=Leaderboard.aspx';
        }
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="leaderboard-container">
            <h2>Leaderboard - Top 10 Scores</h2>
            <asp:GridView ID="leaderboard" runat="server" AutoGenerateColumns="False" CssClass="leaderboard-table">
                <Columns>
                    <asp:BoundField DataField="Username" HeaderText="Username" />
                    <asp:BoundField DataField="Score" HeaderText="Score" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</asp:Content>