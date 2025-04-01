<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/WondersMaster.Master" AutoEventWireup="true" CodeBehind="great_wall_of_china.aspx.cs" Inherits="website.Wonders.great_wall_of_china" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main">
        <h1 class="title">Great Wall of China</h1>

        <section>
            <h2 class="section-title">History</h2>

            <p>
                <strong>The Great Wall of China</strong> began as a series of fortifications built as early as the 
                <strong class="tooltip">7th century BC
                    <span class="tooltiptext">Construction started over 2,700 years ago!</span>
                </strong> 
                by different Chinese states to defend against invasions from nomadic groups. After China was unified in
                <em>221 BC</em> by <strong class="tooltip">Qin Shi Huang
                    <span class="tooltiptext">The first emperor of unified China</span>
                </strong>
                ,he connected existing walls to form a cohesive defense system against northern invaders, particularly the Xiongnu.
                Over the centuries, different dynasties added to and repaired the wall, with the most extensive construction taking place during the 
                <strong class="tooltip">Ming dynasty
                    <span class="tooltiptext">Known for building the most durable sections of the wall</span>
                </strong>
                (<em>1368–1644</em>).
                <img src="\img\great_wall_of_china_history.jpg" style="border: 2px solid #ccc; border-radius: 10px; box-shadow: 2px 2px 10px #aaa;" />
            </p>
        </section>
         <span class="tooltiptext"></span>

        <section>
            <h2 class="section-title">Architecture and Construction</h2>

            <p>
                The wall stretches over <strong class="tooltip">21,000 km (13,170 miles)
                    <span class="tooltiptext">That's over half the circumference of the Earth!</span>
                </strong>,
                traversing mountains, deserts, and plains. The construction techniques and materials used varied depending on the region, with earlier sections made from
                <strong>rammed earth</strong> and later sections built with 
                <strong class="tooltip">brick, stone
                    <span class="tooltiptext">Materials used during the Ming dynasty for durability.</span>
                </strong>
                and other durable materials.
                The Ming dynasty fortified their sections of the wall with watchtowers, signal towers, and garrison stations.
                The design of the wall also adapted to the terrain, winding over rugged mountains and through arid deserts,
                making it one of the most impressive architectural and engineering feats in history.
                <img src="\img\great_wall_of_china_construction.jpg" />
            </p>
        </section>


        <section>
            <h2 class="section-title">Significance</h2>

            <p>
                The Great Wall served as much more than a physical barrier. It was a symbol of the
                <strong class="tooltip">strength and determination
                    <span class="tooltiptext">Represented the resilience of the Chinese people.</span>
                </strong>
                of the Chinese people to protect their culture and land.
                Militarily, it provided an early warning system through its signaling towers, where 
                <strong class="tooltip">smoke signals and fires
                    <span class="tooltiptext">Used for fast communication over long distances.</span>
                </strong>
                would be used to relay messages.
                Economically, it controlled trade routes such as the <strong>Silk Road</strong> by regulating the flow of goods and imposing duties.
                It also helped with immigration control, ensuring that people crossing into China did so through regulated checkpoints.
                The wall was not just a defense structure but a tool for governance and control.
            </p>

            <div class="video-container">
                <iframe src="https://www.youtube.com/embed/23oHqNEqRyo" 
                        title="YouTube video player" 
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
                        allowfullscreen>
                </iframe>
            </div>
        </section>


        <section>
            <h2 class="section-title">Present Day</h2>

            <p>
                Today, the Great Wall is one of the most visited
                <strong class="tooltip">tourist attractions
                    <span class="tooltiptext">Over 10 million visitors annually.</span>
                </strong>
                in the world and has become a symbol of China’s cultural heritage and historical resilience.
                Many parts of the wall, especially those near <strong>Beijing</strong>,
                have been restored for tourism, while other sections have fallen into disrepair or have been eroded by natural forces.
                The wall was designated a 
                <strong class="tooltip">UNESCO World Heritage Site
                    <span class="tooltiptext">Recognized for its cultural significance in 1987.</span>
                </strong>, 
                ensuring that efforts to preserve and maintain it continue.
                While the wall is no longer a functional defense mechanism, it remains an iconic representation of China’s rich history.
                <img src="\img\great_wall_of_china_presentday.jpg" />
            </p>
        </section>

        <section>
            <h2 class="section-title">Myths and Legacy</h2>

            <p>
                One of the most popular myths surrounding the Great Wall is that it is visible from space, which has been debunked by astronauts.
                Despite this, the wall’s legacy as a testament to human perseverance and ingenuity is unquestioned.
                It continues to inspire awe and fascination worldwide, symbolizing both China’s ancient strength and its enduring spirit in the modern era.
            </p>
        </section>

    </div>



    <div id="navigation">

        <div class="navigation-item">History</div>
        <div class="navigation-item">Architecture and Construction</div>
        <div class="navigation-item">Significance</div>
        <div class="navigation-item">Present Day</div>
        <div class="navigation-item">Myths and Legacy</div>

    </div>

</asp:Content>