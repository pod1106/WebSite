<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/WondersMaster.Master" AutoEventWireup="true" CodeBehind="machu_picchu.aspx.cs" Inherits="website.Wonders.machu_picchu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<div id="main">

    <h1 class="title">Machu Picchu</h1>
    <section>
        <h2 class="section-title">
            Origins
        </h2>

        <p>
            Machu Picchu is an ancient Inca city located in the Andes Mountains of Peru. Built in the 15th century under the reign of the Inca emperor Pachacuti, it is believed to have been a royal estate or religious site. The city remained largely unknown to the outside world until its rediscovery by explorer Hiram Bingham in 1911. Despite its abandonment in the 16th century, likely due to the Spanish conquest, the site remains one of the most well-preserved examples of Inca architecture.
            <img src="\img\machu_picchu_history.jpg" />
        </p>
    </section>

    <section>
        <h2 class="section-title">
            Architecture
        </h2>

        <p>
            Machu Picchu is known for its exceptional Inca architecture, which demonstrates advanced engineering and construction techniques. The site features impressive terraces, ceremonial platforms, and temples, all built using precisely cut stonework without mortar. Key structures include the Intihuatana stone, the Temple of the Sun, and the Room of the Three Windows. The site was strategically built on a ridge to align with the surrounding landscape and astronomical events, showcasing the Incas’ deep understanding of both construction and nature.
            <img src="\img\machu_picchu_architecture.jpg" />
        </p>
    </section>

    <section>
        <h2 class="section-title">
            Culture
        </h2>

        <p>
            Machu Picchu was not only an architectural wonder but also a cultural and religious center for the Inca Empire. It is believed to have been a site for worship, particularly related to the Sun God, Inti. The layout of the city reflects the Inca's spiritual connection to the mountains and the natural world. Machu Picchu's precise alignment with the sun’s movements during solstices suggests it also served as an astronomical observatory and calendar.
            <img src="\img\machu_picchu_culture.jpg" />
        </p>
    </section>

    <section>
        <h2 class="section-title">
            Legacy
        </h2>

        <p>
            Today, Machu Picchu is one of the most iconic landmarks in the world and a UNESCO World Heritage Site. It is a symbol of Incan ingenuity and the rich cultural history of Peru. The site continues to inspire admiration for its remarkable preservation and its contribution to our understanding of ancient civilizations. Machu Picchu is also a symbol of Peru's national identity and a reminder of the importance of preserving cultural heritage for future generations.
        </p>
    </section>

</div>

<div id="navigation">

    <div class="navigation-item">Origins</div>
    <div class="navigation-item">Architecture</div>
    <div class="navigation-item">Culture</div>
    <div class="navigation-item">Legacy</div>

</div>



</asp:Content>
