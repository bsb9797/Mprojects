<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.quizweb.model.*" %>
<%@ page isELIgnored="false"%>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/user/login");
        return;
    }

    Quiz quiz = (Quiz) request.getAttribute("quiz");
    Question question = (Question) request.getAttribute("question");
    int questionNumber = (Integer) request.getAttribute("questionNumber");
    int totalQuestions = (Integer) request.getAttribute("totalQuestions");
    Integer savedAnswer = (Integer) request.getAttribute("savedAnswer");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title><%= quiz.getQuizTitle() %> - Attempt Quiz</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<style>
/* RESET */
* { margin:0; padding:0; box-sizing:border-box; }

/* BODY & BACKGROUND */
body {
    background: linear-gradient(135deg, #0e0e11, #1a1a20);
    min-height: 100vh;
    padding: 40px 20px;
    font-family: "Poppins", sans-serif;
    display: flex;
    justify-content: center;
    color: #fff;
}

/* PARTICLES */
.particle {
    position: fixed;
    width: 6px;
    height: 6px;
    border-radius: 50%;
    background: rgba(255,255,255,0.08);
    z-index: -1;
}

/* QUIZ CONTAINER */
.quiz-box {
    width: 900px;
    max-width: 95%;
    background: rgba(255,255,255,0.06);
    padding: 40px 30px;
    border-radius: 16px;
    backdrop-filter: blur(14px);
    box-shadow: 0 10px 30px rgba(0,0,0,0.55);
}

/* TITLE */
.quiz-title {
    font-size: 28px;
    font-weight: 600;
    color: #4ecbff;
    margin-bottom: 10px;
}

/* QUESTION PROGRESS */
.question-progress {
    color: #bbb;
    font-size: 14px;
    margin-bottom: 25px;
    text-align: right;
}

/* QUESTION */
.question-text {
    font-size: 20px;
    font-weight: 500;
    margin-bottom: 25px;
}

/* OPTIONS */
.option {
    background: rgba(255,255,255,0.1);
    padding: 16px 18px;
    border-radius: 12px;
    margin-bottom: 15px;
    border: 2px solid transparent;
    cursor: pointer;
    transition: 0.25s ease;
    display: flex;
    align-items: center;
}
.option:hover {
    background: rgba(0,180,255,0.15);
    border-color: #00b7ff;
}
.option.selected {
    background: #00b7ff;
    color: #fff;
    border-color: #0086c9;
}
.option input {
    margin-right: 10px;
}

/* BUTTONS */
.nav-buttons {
    margin-top: 30px;
    display: flex;
    justify-content: space-between;
}

.btn {
    padding: 12px 26px;
    border-radius: 40px;
    font-size: 15px;
    font-weight: bold;
    border: none;
    cursor: pointer;
    color: #fff;
    transition: 0.3s ease;
}

.btn-prev { background: #666; }
.btn-prev:hover { background: #555; }

.btn-next {
    background: #007bff;
}
.btn-next:hover {
    background: #0063d1;
}

.btn-submit {
    background: #28c76f;
}
.btn-submit:hover {
    background: #20b863;
}
</style>

<script>
// Wait for DOM before adding particles or selecting options
document.addEventListener("DOMContentLoaded", function() {
    // STATIC PARTICLES
    for (let i = 0; i < 30; i++) {
        const p = document.createElement("div");
        p.className = "particle";
        p.style.left = Math.random() * window.innerWidth + "px";
        p.style.top = Math.random() * window.innerHeight + "px";
        document.body.appendChild(p);
    }

    // Restore saved answer if any
    <% if (savedAnswer != null) { %>
        selectOption(<%= savedAnswer %>);
    <% } %>
});

// Function to select option
function selectOption(num) {
    document.querySelectorAll(".option").forEach(o => o.classList.remove("selected"));
    const opt = document.getElementById("opt" + num);
    if(opt){
        opt.classList.add("selected");
        const radio = document.getElementById("radio" + num);
        if(radio) radio.checked = true;
    }
}
</script>

</head>

<body>

<div class="quiz-box">

    <div class="quiz-title"><%= quiz.getQuizTitle() %></div>

    <div class="question-progress">
        Question <%= questionNumber %> of <%= totalQuestions %>
    </div>

    <div class="question-text">
        <%= question.getQuestionText() %>
    </div>

    <form action="${pageContext.request.contextPath}/user/attemptQuiz" method="post">

        <div id="opt1" class="option" onclick="selectOption(1)">
            <input type="radio" id="radio1" name="selectedOption" value="1"
                <%= (savedAnswer!=null && savedAnswer==1)?"checked":"" %> />
            <label><%= question.getOption1() %></label>
        </div>

        <div id="opt2" class="option" onclick="selectOption(2)">
            <input type="radio" id="radio2" name="selectedOption" value="2"
                <%= (savedAnswer!=null && savedAnswer==2)?"checked":"" %> />
            <label><%= question.getOption2() %></label>
        </div>

        <div id="opt3" class="option" onclick="selectOption(3)">
            <input type="radio" id="radio3" name="selectedOption" value="3"
                <%= (savedAnswer!=null && savedAnswer==3)?"checked":"" %> />
            <label><%= question.getOption3() %></label>
        </div>

        <div id="opt4" class="option" onclick="selectOption(4)">
            <input type="radio" id="radio4" name="selectedOption" value="4"
                <%= (savedAnswer!=null && savedAnswer==4)?"checked":"" %> />
            <label><%= question.getOption4() %></label>
        </div>

        <div class="nav-buttons">

            <% if (questionNumber > 1) { %>
                <button class="btn btn-prev" type="submit" name="action" value="previous">Previous</button>
            <% } else { %>
                <div></div>
            <% } %>

            <% if (questionNumber < totalQuestions) { %>
                <button class="btn btn-next" type="submit" name="action" value="next">Next</button>
            <% } else { %>
                <button class="btn btn-submit" type="submit" name="action" value="submit">Submit</button>
            <% } %>

        </div>

    </form>

</div>

</body>
</html>
