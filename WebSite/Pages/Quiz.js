
const q = [

    {
        question: "Where is the Great Wall of China located?",
        options: ["China", "India", "Japan", "South Korea"],
        answer: 0
    },
    {
        question: "What material is the Great Wall of China primarily made from?",
        options: ["Wood", "Stone", "Brick", "Iron"],
        answer: 2
    },
    {
        question: "Which of the following is considered one of the New Seven Wonders of the World?",
        options: ["The Taj Mahal", "Machu Picchu", "Chichen Itza", "All of the above"],
        answer: 3
    },
    {
        question: "Where is the Taj Mahal located?",
        options: ["India", "Pakistan", "Nepal", "Sri Lanka"],
        answer: 0
    },
    {
        question: "Which wonder of the world is located in Peru?",
        options: ["The Colosseum", "Machu Picchu", "Christ the Redeemer", "The Great Wall of China"],
        answer: 1
    },
    {
        question: "What type of structure is the Colosseum in Rome?",
        options: ["Temple", "Amphitheater", "Palace", "Pyramid"],
        answer: 1
    },
    {
        question: "The Christ the Redeemer statue is located in which country?",
        options: ["Mexico", "Brazil", "Argentina", "Chile"],
        answer: 1
    },
    {
        question: "What is the Christ the Redeemer statue made of?",
        options: ["Concrete", "Stone", "Copper", "Marble"],
        answer: 0
    },
    {
        question: "Which of the following is the largest pyramid in Egypt?",
        options: ["The Pyramid of Giza", "The Great Pyramid of Cholula", "The Red Pyramid", "The Bent Pyramid"],
        answer: 0
    },
    {
        question: "Which wonder is located in Jordan?",
        options: ["Petra", "Machu Picchu", "The Great Wall of China", "Christ the Redeemer"],
        answer: 0
    },
    {
        question: "Which ancient wonder was located in the city of Babylon?",
        options: ["The Hanging Gardens", "The Statue of Zeus", "The Lighthouse of Alexandria", "The Temple of Artemis"],
        answer: 0
    },
    {
        question: "The Machu Picchu ruins are found in which mountain range?",
        options: ["The Andes", "The Rockies", "The Himalayas", "The Alps"],
        answer: 0
    },

];













const questions = [
    {
        question: "Which of the following is one of the Seven Wonders of the Ancient World?",
        options: ["The Great Wall of China", "The Colosseum", "The Lighthouse of Alexandria", "Christ the Redeemer"],
        answer: 2
    },
    {
        question: "Where was the Statue of Zeus, one of the Seven Wonders of the Ancient World, located?",
        options: ["Rome", "Athens", "Babylon", "Cairo"],
        answer: 1
    }
];

let correctAnswers = 0;


let currentQuestionIndex = 0;


document.addEventListener("DOMContentLoaded", function () {
    loadQuestion();

    const submitBtn = document.getElementById("submit-btn");
    submitBtn.addEventListener("click", handleSubmit);
});


function loadQuestion() {
    const questionContainer = document.getElementById("question-container");


    let currentQuestion = questions[currentQuestionIndex];
    questionContainer.innerText = currentQuestion.question;

    document.getElementById("answ-1").innerText = currentQuestion.options[0];
    document.getElementById("answ-2").innerText = currentQuestion.options[1];
    document.getElementById("answ-3").innerText = currentQuestion.options[2];
    document.getElementById("answ-4").innerText = currentQuestion.options[3];

    const radioButtons = document.querySelectorAll('input[name="answ"]');
    radioButtons.forEach(radio => radio.checked = false);


    const submitBtn = document.getElementById("submit-btn");
    if (currentQuestionIndex === questions.length - 1) {
        submitBtn.innerText = "Finish";
    }


}




let selectedOption = null;



function handleSubmit() {
    let selectedOption = null;
    selectedOption = document.querySelector('input[name="answ"]:checked');
    if (selectedOption === null) {
        alert("Please select an option!");
        return;
    }
   

    selectedOption = parseInt(selectedOption.id.replace("option-", ""));


    const currentQuestion = questions[currentQuestionIndex];

    if (selectedOption === currentQuestion.answer) {
        correctAnswers++
    }


    currentQuestionIndex++;

    if (currentQuestionIndex < questions.length) {
        loadQuestion();
        selectedOption = null;

    } else {

        document.getElementById("Quiz").style.display = "none";
        document.getElementById("result").style.display = "block";

        document.getElementById("score").textContent = correctAnswers;


        
    }
}

function leaderboard() {
    window.location.href = 'Leaderboard.aspx';
}