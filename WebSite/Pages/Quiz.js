
const questions = [
    {
        question: "What is 2 + 2?",
        options: ["3", "4", "5", "6"],
        answer: 1
    },
    {
        question: "What is the capital of France?",
        options: ["Berlin", "London", "Paris", "Rome"],
        answer: 2
    },

];



let currentQuestionIndex = 0;


document.addEventListener("DOMContentLoaded", function () {
    loadQuestion();

    const submitBtn = document.getElementById("submit-btn");
    submitBtn.addEventListener("click", handleSubmit);
});

function loadQuestion() {
    const questionContainer = document.getElementById("question-container");
    const optionsContainer = document.getElementById("options-container");


    let currentQuestion = questions[currentQuestionIndex];
    questionContainer.innerText = currentQuestion.question;

    // Load the options
    currentQuestion.options.forEach((option, index) => {
        const li = document.createElement("li");
        li.innerText = option;
        li.addEventListener("click", () => selectOption(index));
        optionsContainer.appendChild(li);
    });
}

let selectedOption = null; // Track the selected option

function selectOption(index) {
    selectedOption = index; // Store the selected option index
    console.log(`Selected option: ${index}`);
}

function handleSubmit() {
    if (selectedOption === null) {
        alert("Please select an option!");
        return;
    }

    const currentQuestion = questions[currentQuestionIndex];
    if (selectedOption === currentQuestion.answer) {
        alert("Correct!");
    } else {
        alert("Incorrect. Try the next one!");
    }

    // Move to the next question
    currentQuestionIndex++;

    if (currentQuestionIndex < questions.length) {
        loadQuestion(); // Load the next question
        selectedOption = null; // Reset the selected option
    } else {
        alert("Quiz finished!");
        // Optionally, reload or redirect the page
        // location.reload();
    }
}