<%@ Page Title="" Language="C#" MasterPageFile="~/Wonders/WondersMaster.Master" AutoEventWireup="true" CodeBehind="great_wall_of_china.aspx.cs" Inherits="website.Wonders.great_wall_of_china" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        body {
            font-family: Arial, sans-serif; /* Clean and readable font */
            line-height: 1.6; /* Make the text easier to read by adding spacing between lines */
            margin: 0;
            padding: 0;
            background-color: #f4f4f4; /* Soft background color for a pleasant reading experience */
        }

        /* Main container for the entire content */
        div {
            max-width: 900px; /* Limit the width for readability */
            margin: 0 auto; /* Center the content */
            padding: 20px; /* Add some space around the content */
            background-color: #ffffff; /* White background for the content area */
            border-radius: 10px; /* Slightly rounded corners for a softer look */
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1); /* Add subtle shadow for depth */
        }

        /* Header (Main title) */
        h1 {
            text-align: center; /* Center the main heading */
            font-size: 2.5rem; /* Larger font size for the title */
            color: #333; /* Dark color for better contrast */
            margin-bottom: 20px; /* Space below the main title */
        }

        /* Section headings */
        h2 {
            font-size: 1.8rem; /* Slightly smaller than the main title */
            color: #2c3e50; /* Dark color for section headings */
            border-bottom: 2px solid #3498db; /* Blue underline for emphasis */
            padding-bottom: 5px; /* Space between heading and underline */
            margin-bottom: 15px; /* Space below the heading */
        }

        /* Paragraph styling */
        p {
            font-size: 1.1rem; /* Increase font size for better readability */
            color: #555; /* Lighter shade of grey for text */
            margin-bottom: 15px; /* Space between paragraphs */
        }

        /* Section styles for better spacing and separation */
        section {
            margin-bottom: 30px; /* Add space between sections */
        }

        /* Special styles for last section */
        section:last-child {
            margin-bottom: 0; /* No bottom margin for the last section */
        }

        /* Optional: Add a subtle background color to each section */
        section:nth-child(odd) {
            background-color: #ecf0f1; /* Light grey background for alternating sections */
        }

        /* Add a hover effect for the headings to make them interactive */
        h2:hover {
            color: #3498db; /* Change heading color on hover */
            cursor: pointer; /* Indicate that the headings are interactive */
        }

        /* Link styling (if any) */
        a {
            color: #3498db; /* Blue color for links */
            text-decoration: none; /* Remove underline */
        }

        a:hover {
            text-decoration: underline; /* Underline links on hover */
        }


    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div>

        <h1>Great Wall of China</h1>
        <section>
            <h2>
                History
            </h2>

            <p>
                The Great Wall of China began as a series of fortifications built as early as the 7th century BC by different Chinese states to defend against invasions from nomadic groups.
                After China was unified in 221 BC by Qin Shi Huang, he connected existing walls to form a cohesive defense system against northern invaders, particularly the Xiongnu.
                Over the centuries, different dynasties added to and repaired the wall, with the most extensive construction taking place during the Ming dynasty (1368–1644).
                The Ming were particularly concerned about Mongol incursions and built much of what remains today using stronger materials like bricks and stone.
                The Great Wall served as a military defense, a control mechanism for immigration and trade, and a symbol of the strength of the Chinese empire.
                <img src="\img\great_wall_of_china_1.jpg"" />
            </p>
        </section>

        <section>
            <h2>
                Architecture and Construction
            </h2>

            <p>
                The wall stretches over 21,000 km (13,170 miles), traversing mountains, deserts, and plains.
                The construction techniques and materials used varied depending on the region, with earlier sections made from rammed earth and later sections built with brick, stone, and other durable materials.
                The Ming dynasty fortified their sections of the wall with watchtowers, signal towers, and garrison stations.
                The design of the wall also adapted to the terrain, winding over rugged mountains and through arid deserts, making it one of the most impressive architectural and engineering feats in history.
            </p>
        </section>

        <section>
            <h2>
                Significance
            </h2>

            <p>
                The Great Wall served as much more than a physical barrier. It was a symbol of the strength and determination of the Chinese people to protect their culture and land.
                Militarily, it provided an early warning system through its signaling towers, where smoke signals and fires would be used to relay messages.
                Economically, it controlled trade routes such as the Silk Road by regulating the flow of goods and imposing duties.
                It also helped with immigration control, ensuring that people crossing into China did so through regulated checkpoints.
                The wall was not just a defense structure but a tool for governance and control.
            </p>
        </section>

        <section>
            <h2>
                Present Day
            </h2>

            <p>
                Today, the Great Wall is one of the most visited tourist attractions in the world and has become a symbol of China’s cultural heritage and historical resilience.
                Many parts of the wall, especially those near Beijing, have been restored for tourism, while other sections have fallen into disrepair or have been eroded by natural forces.
                The wall was designated a UNESCO World Heritage Site in 1987, ensuring that efforts to preserve and maintain it continue.
                While the wall is no longer a functional defense mechanism, it remains an iconic representation of China’s rich history.
            </p>
        </section>


        <section>
            <h2>
                Myths and Legacy
            </h2>

            <p>
                One of the most popular myths surrounding the Great Wall is that it is visible from space, which has been debunked by astronauts.
                Despite this, the wall’s legacy as a testament to human perseverance and ingenuity is unquestioned.
                It continues to inspire awe and fascination worldwide, symbolizing both China’s ancient strength and its enduring spirit in the modern era.
            </p>
        </section>

    </div>






</asp:Content>
