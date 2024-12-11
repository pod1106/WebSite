<%@ Page Title="7 Wonders of the World" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="website.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Basic styles for the layout */


        .container {
            display: flex;
            width: 100%;
        }

        

        .main-content {
            margin-left: 400px;
            flex-grow: 1;
            padding: 20px;
            overflow: auto;
        }

        section {
            margin-bottom: 30px;
            background-color: rgba(0, 0, 0, 0.05);
            border: 2px solid black; 
            border-radius: 8px;
            padding: 10px;
            width: 50vw;

        }

        section h1 {
            font-size: 32px;
            color: #333;
        }

        section p {
            font-size: 18px;
            color: #666;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <!-- Sidebar -->


        <!-- Main Content -->
        <div class="main-content">
            <section id="wonder1" style="height: 300px">
                <h1>Great Wall of China</h1>
                <p>Information about the Great Wall of China...</p>
            </section>

            <section id="wonder2" style="height: 300px">
                <h1>Petra</h1>
                <p>Information about Petra...</p>
            </section>

            <section id="wonder3" style="height: 300px">
                <h1>Christ the Redeemer</h1>
                <p>Information about Christ the Redeemer...</p>
            </section>

            <section id="wonder4"" style="height: 300px">
                <h1>Machu Picchu</h1>
                <p>Information about Machu Picchu...</p>
            </section>

            <section id="wonder5"" style="height: 300px">
                <h1>Chichen Itza</h1>
                <p>Information about Chichen Itza...</p>
            </section>

            <section id="wonder6"" style="height: 300px">
                <h1>Roman Colosseum</h1>
                <p>Information about Roman Colosseum...</p>
            </section>

            <section id="wonder7"" style="height: 300px">
                <h1>Taj Mahal</h1>
                <p>Information about Taj Mahal...</p>
            </section>
        </div>
    </div>


</asp:Content>


