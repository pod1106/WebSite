<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/WondersMaster.Master" AutoEventWireup="true" CodeBehind="taj_mahal.aspx.cs" Inherits="website.Wonders.taj_mahal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<div id="main">

    <h1 class="title">Taj Mahal</h1>
    <section>
        <h2 class="section-title">
            History
        </h2>

        <p>
            The Taj Mahal was built by Emperor Shah Jahan in memory of his wife Mumtaz Mahal, who died during childbirth in 1631. Construction began in 1632 and took over 20 years to complete. The monument was designed as a symbol of eternal love and is considered one of the most beautiful buildings in the world.
            <img src="\img\taj_mahal_history.jpg" />
        </p>
    </section>

    <section>
        <h2 class="section-title">
            Architecture
        </h2>

        <p>
            The Taj Mahal is a masterpiece of Mughal architecture, blending elements from Persian, Ottoman Turkish, and Indian styles. The main structure features a white marble dome surrounded by lush gardens, a reflecting pool, and four minarets. Intricate carvings, semi-precious stones, and calligraphy adorn the surfaces of the monument, creating a stunning visual effect.
            <img src="\img\taj_mahal_architecture.jpg" />
        </p>
    </section>

    <section>
        <h2 class="section-title">
            Symbolism
        </h2>

        <p>
            The Taj Mahal is a symbol of Shah Jahan's profound love for his wife. The symmetry and the materials used in the design represent the balance and perfection of this love. The surrounding gardens, the river, and the placement of the monument also symbolize paradise, adding to the symbolic meaning of eternal love and the connection between life and death.
            <img src="\img\taj_mahal_symbolism.jpg" />
        </p>
    </section>

    <section>
        <h2 class="section-title">
            Legacy
        </h2>

        <p>
            The Taj Mahal is not only an architectural wonder but also a symbol of India’s rich cultural heritage. It attracts millions of visitors annually and is one of the New Seven Wonders of the World. Its influence on architecture and its status as a UNESCO World Heritage Site make it a significant cultural and historical monument.
        </p>
    </section>

</div>

<div id="navigation">

    <div class="navigation-item">History</div>
    <div class="navigation-item">Architecture</div>
    <div class="navigation-item">Symbolism</div>
    <div class="navigation-item">Legacy</div>

</div>



</asp:Content>
