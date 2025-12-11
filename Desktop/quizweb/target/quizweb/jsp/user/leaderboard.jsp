<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.quizweb.model.*, java.util.List" %>
<%
    Quiz quiz = (Quiz) request.getAttribute("quiz");
    List<Leaderboard> leaderboard = (List<Leaderboard>) request.getAttribute("leaderboard");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Leaderboard</title>
    <style>
        * {
            margin: 0; padding: 0; box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #022c43;
            color: #e0f7fa;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 40px 20px;
        }
        .container {
            background: #014d6d;
            max-width: 900px;
            width: 100%;
            border-radius: 16px;
            box-shadow: 0 12px 30px rgba(0, 188, 212, 0.3);
            padding: 40px 35px;
        }
        .header {
            text-align: center;
            margin-bottom: 40px;
        }
        .quiz-name {
            color: #ff6f61;
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 6px;
            letter-spacing: 1.2px;
        }
        .category {
            font-size: 20px;
            font-weight: 600;
            color: #80deea;
            letter-spacing: 1.5px;
        }
        .leaderboard-table {
            background: #023e58;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.4);
        }
        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
        }
        thead {
            background: #00bcd4;
        }
        th, td {
            padding: 16px 18px;
            text-align: left;
            font-weight: 600;
            color: #e0f7fa;
            letter-spacing: 0.05em;
        }
        th {
            text-transform: uppercase;
            font-size: 13px;
            border-bottom: 2px solid #0288d1;
        }
        tbody tr {
            background: #014d6d;
            transition: background-color 0.3s ease;
            cursor: default;
        }
        tbody tr:nth-child(odd) {
            background: #016987;
        }
        tbody tr:hover {
            background: #0288d1;
            color: #fff;
        }
        /* Highlight top 3 ranks */
        .rank-1 {
            background: linear-gradient(90deg, #ffd54f 0%, #ffb300 100%) !important;
            color: #3e2723 !important;
            font-weight: 700;
        }
        .rank-2 {
            background: linear-gradient(90deg, #aed581 0%, #689f38 100%) !important;
            color: #263238 !important;
            font-weight: 700;
        }
        .rank-3 {
            background: linear-gradient(90deg, #81d4fa 0%, #0288d1 100%) !important;
            color: #0d47a1 !important;
            font-weight: 700;
        }
        .btn-back {
            display: inline-block;
            margin-top: 35px;
            padding: 14px 38px;
            background: #ff6f61;
            color: white;
            text-decoration: none;
            border-radius: 30px;
            font-weight: 700;
            font-size: 16px;
            box-shadow: 0 8px 20px rgba(255, 111, 97, 0.55);
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
            user-select: none;
        }
        .btn-back:hover {
            background: #ff826f;
            box-shadow: 0 10px 28px rgba(255, 130, 111, 0.75);
        }
        /* Responsive tweaks */
        @media (max-width: 600px) {
            .container {
                padding: 30px 20px;
            }
            th, td {
                padding: 12px 10px;
                font-size: 14px;
            }
            .quiz-name {
                font-size: 22px;
            }
            .category {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <% if (quiz != null) { %>
                <div class="quiz-name">QUIZ NAME: <%= quiz.getQuizTitle().toUpperCase() %></div>
            <% } %>
            <div class="category">CATEGORY: <%= quiz != null ? quiz.getCategory() : "ALL QUIZZES" %></div>
        </div>
        
        <div class="leaderboard-table">
            <table>
                <thead>
                    <tr>
                        <th>SR NO</th>
                        <th>NAME</th>
                        <th>EMAIL</th>
                        <th>SCORE</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (leaderboard != null && !leaderboard.isEmpty()) {
                        for (Leaderboard entry : leaderboard) {
                            String rankClass = "";
                            if (entry.getSrNo() == 1) rankClass = "rank-1";
                            else if (entry.getSrNo() == 2) rankClass = "rank-2";
                            else if (entry.getSrNo() == 3) rankClass = "rank-3";
                    %>
                        <tr class="<%= rankClass %>">
                            <td><%= entry.getSrNo() %></td>
                            <td><%= entry.getUsername() %></td>
                            <td><%= entry.getEmail() %></td>
                            <td><%= entry.getScore() %></td>
                        </tr>
                    <% }
                    } else { %>
                        <tr>
                            <td colspan="4" style="text-align: center; color: #ffdede; padding: 20px 0;">
                                No attempts yet
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        
        <a href="${pageContext.request.contextPath}/jsp/user/quizList" class="btn-back">Back to Quiz List</a>
    </div>
</body>
</html>
