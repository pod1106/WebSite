<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/WondersMaster.Master" AutoEventWireup="true" CodeBehind="romancolosseum.aspx.cs" Inherits="website.Wonders.romancolosseum" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<div id="main">

    <h1 class="title">Roman Colosseum</h1>
    <section>
        <h2 class="section-title">
            History
        </h2>

        <p>
            The Colosseum, also known as the Flavian Amphitheatre, is an ancient arena located in the heart of Rome, Italy. Completed in AD 80 under the emperor Titus, it was primarily used for gladiatorial contests, animal hunts, and public spectacles such as mock sea battles and executions. As the largest amphitheatre ever built, it could hold up to 50,000 spectators, showcasing the grandeur of the Roman Empire.
            <img src="\img\colosseum_history.jpg" />
        </p>
    </section>

    <section>
        <h2 class="section-title">
            Architecture
        </h2>

        <p>
            The Colosseum's design is a marvel of Roman engineering, featuring a complex system of arches, vaults, and concrete construction. Its elliptical shape was built with tiered seating for spectators, and it included a retractable roof known as the velarium to provide shade. The Colosseum's outer facade was adorned with columns in the Doric, Ionic, and Corinthian styles, demonstrating the Romans' mastery of architectural aesthetics.
            <img src="\img\colosseum_architecture.jpg" />
        </p>
    </section>

    <section>
        <h2 class="section-title">
            Events
        </h2>

        <p>
            The Colosseum was the site of various public spectacles, most notably gladiator combat. These brutal fights were fought between trained warriors, often slaves or prisoners, as a form of entertainment for the masses. Other events included animal hunts, chariot races, and even naval reenactments when the arena was flooded. These events served not only as entertainment but also as a display of Roman power and dominance over both people and nature.
            <img src="\img\colosseum_events.jpg" />
        </p>
    </section>

    <section>
        <h2 class="section-title">
            Decline
        </h2>

        <p>
            After the fall of the Western Roman Empire in the 5th century, the Colosseum fell into disrepair. Earthquakes in the 8th and 9th centuries caused significant damage, and much of the stone was repurposed for other construction projects. By the medieval period, the Colosseum had been abandoned for a time, and the area surrounding it was repurposed for various uses. However, it never lost its symbolic significance.
            <img src="\img\colosseum_decline.jpg"/>
        </p>
    </section>

    <section>
        <h2 class="section-title">
            Legacy
        </h2>

        <p>
            Today, the Colosseum stands as one of the most iconic landmarks in the world, attracting millions of tourists each year. It is a symbol of Roman engineering, culture, and history. Despite centuries of damage, the Colosseum has undergone extensive restoration work and remains a testament to the grandeur of ancient Rome. It is also a symbol of the fight against violence, as it has been associated with the Catholic Church's stance against gladiatorial combat and human suffering.
        </p>
    </section>

</div>

<div id="navigation">

    <div class="navigation-item">History</div>
    <div class="navigation-item">Architecture</div>
    <div class="navigation-item">Events</div>
    <div class="navigation-item">Decline</div>
    <div class="navigation-item">Legacy</div>

</div>



</asp:Content>
