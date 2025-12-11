<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.quizweb.model.*" %>
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
<html>
<head>
    <meta charset="UTF-8" />
    <title>Attempt Quiz - <%= quiz.getQuizTitle() %></title>
    <style>
        * {
            margin: 0; padding: 0; box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f0f4ff;
            color: #1a1a1a;
            min-height: 100vh;
            padding: 40px 15px;
            display: flex;
            justify-content: center;
            align-items: flex-start;
        }
        .container {
            max-width: 700px;
            width: 100%;
            background: white;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(102, 126, 234, 0.3);
            padding: 35px 40px;
        }
        .quiz-header {
            border-bottom: 2px solid #667eea;
            padding-bottom: 15px;
            margin-bottom: 30px;
        }
        .quiz-title {
            font-size: 28px;
            font-weight: 700;
            color: #333;
            margin-bottom: 5px;
        }
        .question-progress {
            font-size: 14px;
            color: #555;
            font-weight: 600;
        }
        .question-text {
            font-size: 22px;
            font-weight: 600;
            color: #222;
            margin-bottom: 30px;
            line-height: 1.3;
        }
        form {
            user-select: none;
        }
        .option {
            background: #e9efff;
            border: 2px solid transparent;
            padding: 16px 22px;
            margin-bottom: 18px;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            font-size: 18px;
            font-weight: 500;
            color: #334680;
        }
        .option:hover {
            background: #d0dbff;
            border-color: #667eea;
        }
        .option.selected {
            background: #667eea;
            color: white;
            border-color: #4455cc;
            font-weight: 700;
            box-shadow: 0 0 10px rgba(102, 126, 234, 0.7);
        }
        .option input[type="radio"] {
            margin-right: 18px;
            cursor: pointer;
            width: 20px;
            height: 20px;
        }
        .navigation {
            margin-top: 40px;
            display: flex;
            justify-content: space-between;
        }
        .btn {
            background: #667eea;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 14px 36px;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            box-shadow: 0 6px 16px rgba(102, 126, 234, 0.35);
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }
        .btn:hover {
            background: #4455cc;
            box-shadow: 0 8px 20px rgba(68, 85, 204, 0.6);
        }
        .btn-previous {
            background: #9aa5c1;
            box-shadow: 0 6px 16px rgba(154, 165, 193, 0.35);
        }
        .btn-previous:hover {
            background: #7c85a5;
            box-shadow: 0 8px 20px rgba(124, 133, 165, 0.6);
        }
        .btn-submit {
            background: #28a745;
            box-shadow: 0 6px 16px rgba(40, 167, 69, 0.4);
        }
        .btn-submit:hover {
            background: #1e7e34;
            box-shadow: 0 8px 20px rgba(30, 126, 52, 0.6);
        }
        @media (max-width: 600px) {
            .container {
                padding: 25px 20px;
            }
            .quiz-title {
                font-size: 24px;
            }
            .question-text {
                font-size: 20px;
            }
            .btn {
                padding: 12px 28px;
                font-size: 14px;
            }
            .option {
                font-size: 16px;
                padding: 14px 18px;
            }
        }
    </style>
    <script>
        function selectOption(optionNum) {
            document.querySelectorAll('.option').forEach(opt => opt.classList.remove('selected'));
            const selectedOpt = document.getElementById('opt' + optionNum);
            if(selectedOpt) {
                selectedOpt.classList.add('selected');
            }
            const radioInput = document.getElementById('radio' + optionNum);
            if(radioInput) {
                radioInput.checked = true;
            }
        }
        window.addEventListener('DOMContentLoaded', () => {
            // Highlight saved answer on page load
            <% if (savedAnswer != null) { %>
                selectOption(<%= savedAnswer %>);
            <% } %>
        });
    </script>
</head>
<body>
    <div class="container">
        <div class="quiz-header">
            <div class="quiz-title"><%= quiz.getQuizTitle() %></div>
            <div class="question-progress">Question <%= questionNumber %> of <%= totalQuestions %></div>
        </div>

        <div class="question-text"><%= question.getQuestionText() %></div>

        <form action="${pageContext.request.contextPath}/jsp/user/attemptQuiz" method="post">
            <div class="option <%= (savedAnswer != null && savedAnswer == 1) ? "selected" : "" %>" id="opt1" onclick="selectOption(1)">
                <input type="radio" name="selectedOption" value="1" id="radio1" <%= (savedAnswer != null && savedAnswer == 1) ? "checked" : "" %> />
                <label for="radio1"><%= question.getOption1() %></label>
            </div>
            <div class="option <%= (savedAnswer != null && savedAnswer == 2) ? "selected" : "" %>" id="opt2" onclick="selectOption(2)">
                <input type="radio" name="selectedOption" value="2" id="radio2" <%= (savedAnswer != null && savedAnswer == 2) ? "checked" : "" %> />
                <label for="radio2"><%= question.getOption2() %></label>
            </div>
            <div class="option <%= (savedAnswer != null && savedAnswer == 3) ? "selected" : "" %>" id="opt3" onclick="selectOption(3)">
                <input type="radio" name="selectedOption" value="3" id="radio3" <%= (savedAnswer != null && savedAnswer == 3) ? "checked" : "" %> />
                <label for="radio3"><%= question.getOption3() %></label>
            </div>
            <div class="option <%= (savedAnswer != null && savedAnswer == 4) ? "selected" : "" %>" id="opt4" onclick="selectOption(4)">
                <input type="radio" name="selectedOption" value="4" id="radio4" <%= (savedAnswer != null && savedAnswer == 4) ? "checked" : "" %> />
                <label for="radio4"><%= question.getOption4() %></label>
            </div>

            <div class="navigation">
                <% if (questionNumber > 1) { %>
                    <button type="submit" name="action" value="previous" class="btn btn-previous">Previous</button>
                <% } else { %>
                    <div></div>
                <% } %>

                <% if (questionNumber < totalQuestions) { %>
                    <button type="submit" name="action" value="next" class="btn btn-next">Next</button>
                <% } else { %>
                    <button type="submit" name="action" value="submit" class="btn btn-submit">Submit Quiz</button>
                <% } %>
            </div>
        </form>
    </div>
</body>
</html>
