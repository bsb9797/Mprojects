<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.quizweb.model.*, java.util.List, java.util.Map" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/user/login");
        return;
    }
    int score = (Integer) request.getAttribute("score");
    int totalQuestions = (Integer) request.getAttribute("totalQuestions");
    Quiz quiz = (Quiz) request.getAttribute("quiz");
    List<Question> questions = (List<Question>) request.getAttribute("questions");
    Map<Integer, Integer> userAnswers = (Map<Integer, Integer>) request.getAttribute("userAnswers");
    double percentage = (score * 100.0) / totalQuestions;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Quiz Result</title>
    <style>
        * {
            margin: 0; padding: 0; box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f5f5;
            min-height: 100vh;
            padding: 30px 20px;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
        }
        .result-card {
            background: white;
            padding: 40px 35px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
            margin-bottom: 40px;
        }
        .result-card h1 {
            font-weight: 700;
            font-size: 36px;
            color: #333;
        }
        .score-display {
            font-size: 72px;
            font-weight: 900;
            color: #28a745;
            margin: 25px 0 10px;
        }
        .percentage {
            font-size: 28px;
            color: #555;
            margin-bottom: 25px;
        }
        .btn {
            display: inline-block;
            padding: 14px 36px;
            margin: 10px 15px 0;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 700;
            font-size: 16px;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
            cursor: pointer;
            user-select: none;
        }
        .btn-leaderboard {
            background: #667eea;
            color: white;
            border: none;
        }
        .btn-leaderboard:hover {
            background: #5563d6;
            box-shadow: 0 8px 28px rgba(85, 99, 214, 0.7);
        }
        .btn-home {
            background: #6c757d;
            color: white;
            border: none;
        }
        .btn-home:hover {
            background: #585e63;
            box-shadow: 0 8px 28px rgba(88, 94, 99, 0.7);
        }
        .answers-review {
            background: white;
            padding: 35px 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        .answers-review h2 {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 30px;
            color: #333;
            text-align: center;
        }
        .question-review {
            margin-bottom: 28px;
            padding: 22px 28px;
            border-left: 6px solid #ddd;
            border-radius: 0 10px 10px 0;
            background: #fafafa;
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }
        .question-review.correct {
            border-left-color: #28a745;
            background: #e9f8ee;
        }
        .question-review.incorrect {
            border-left-color: #dc3545;
            background: #fdf2f2;
        }
        .question-review h3 {
            font-weight: 700;
            font-size: 20px;
            color: #222;
        }
        .question-review p {
            margin-top: 14px;
            font-size: 16px;
            color: #444;
        }
        .correct-answer {
            color: #28a745;
            font-weight: 700;
        }
        .wrong-answer {
            color: #dc3545;
            font-weight: 700;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="result-card">
            <h1>Quiz Completed!</h1>
            <div class="score-display"><%= score %> / <%= totalQuestions %></div>
            <div class="percentage"><%= String.format("%.1f", percentage) %>%</div>
            
            <a href="${pageContext.request.contextPath}/jsp/user/leaderboard?quizId=<%= quiz.getQuizId() %>" class="btn btn-leaderboard">View Leaderboard</a>
            <a href="${pageContext.request.contextPath}/jsp/user/quizList" class="btn btn-home">Back to Quiz List</a>
        </div>
        
        <div class="answers-review">
            <h2>Review Your Answers</h2>
            <%
            int qNum = 1;
            for (Question q : questions) {
                Integer userAnswer = userAnswers.get(q.getQuestionId());
                boolean isCorrect = userAnswer != null && userAnswer == q.getCorrectOption();
                String[] options = {q.getOption1(), q.getOption2(), q.getOption3(), q.getOption4()};
            %>
                <div class="question-review <%= isCorrect ? "correct" : "incorrect" %>">
                    <h3>Question <%= qNum++ %>: <%= q.getQuestionText() %></h3>
                    <p>
                        <strong>Your Answer:</strong>
                        <span class="<%= isCorrect ? "correct-answer" : "wrong-answer" %>">
                            <%= userAnswer != null ? options[userAnswer - 1] : "Not answered" %>
                        </span>
                    </p>
                    <% if (!isCorrect) { %>
                        <p>
                            <strong>Correct Answer:</strong>
                            <span class="correct-answer"><%= options[q.getCorrectOption() - 1] %></span>
                        </p>
                    <% } %>
                </div>
            <% } %>
        </div>
    </div>
</body>
</html>
