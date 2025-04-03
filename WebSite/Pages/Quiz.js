

const questions = [
    {
        question: "Which of the following is one of the Seven Wonders of the Ancient World?",
        options: ["The Great Wall of China", "The Colosseum", "The Lighthouse of Alexandria", "Christ the Redeemer"],
        answer: 3
    },
    {
        question: "Where was the Statue of Zeus, one of the Seven Wonders of the Ancient World, located?",
        options: ["Rome", "Athens", "Babylon", "Cairo"],
        answer: 2
    },
    {
        question: "Where is the Great Wall of China located?",
        options: ["Japan", "India", "China", "South Korea"],
        answer: 3
    },
    {
        question: "What material is the Great Wall of China primarily made from?",
        options: ["Wood", "Brick", "Stone", "Iron"],
        answer: 2
    },
    {
        question: "Which of the following is considered one of the New Seven Wonders of the World?",
        options: ["The Taj Mahal", "Machu Picchu", "Chichen Itza", "All of the above"],
        answer: 4
    },
    {
        question: "Where is the Taj Mahal located?",
        options: ["Pakistan", "India", "Nepal", "Sri Lanka"],
        answer: 2
    },
    {
        question: "Which wonder of the world is located in Peru?",
        options: ["The Colosseum", "Machu Picchu", "Christ the Redeemer", "The Great Wall of China"],
        answer: 2
    },
    {
        question: "What type of structure is the Colosseum in Rome?",
        options: ["Temple", "Palace", "Amphitheater", "Pyramid"],
        answer: 3
    },
    {
        question: "The Christ the Redeemer statue is located in which country?",
        options: ["Mexico", "Argentina", "Brazil", "Chile"],
        answer: 3
    },
    {
        question: "What is the Christ the Redeemer statue made of?",
        options: ["Marble", "Stone", "Copper", "Concrete"],
        answer: 4
    },
    {
        question: "Which of the following is the largest pyramid in Egypt?",
        options: ["The Pyramid of Giza", "The Great Pyramid of Cholula", "The Red Pyramid", "The Bent Pyramid"],
        answer: 1
    },
    {
        question: "Which wonder is located in Jordan?",
        options: ["Machu Picchu", "The Great Wall of China", "Petra", "Christ the Redeemer"],
        answer: 3
    },
    {
        question: "Which ancient wonder was located in the city of Babylon?",
        options: ["The Statue of Zeus", "The Lighthouse of Alexandria", "The Hanging Gardens", "The Temple of Artemis"],
        answer: 3
    },
    {
        question: "The Machu Picchu ruins are found in which mountain range?",
        options: ["The Rockies", "The Himalayas", "The Alps", "The Andes"],
        answer: 4
    },
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
        submitBtn.textContent = "Finish";
    }
}

function handleSubmit() {
    const selectedOption = document.querySelector('input[name="answ"]:checked');
    if (!selectedOption) {
        alert("Please select an option!");
        return;
    }

    const currentQuestion = questions[currentQuestionIndex];
    if (parseInt(selectedOption.id.replace("option-", "")) === currentQuestion.answer) {
        correctAnswers++;
        
    }

    currentQuestionIndex++;
    if (currentQuestionIndex < questions.length) {
        loadQuestion();
    } else {
        document.getElementById("Quiz").style.display = "none";
        document.getElementById("result").style.display = "block";
        document.getElementById("score").textContent = correctAnswers;

        fetch("Quiz.aspx/SubmitScore", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({ score: correctAnswers })
        });
    }
}


function leaderboard() {
    window.location.href = 'Leaderboard.aspx';
}
