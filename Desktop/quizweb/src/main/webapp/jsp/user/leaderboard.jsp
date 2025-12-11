<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.quizweb.model.*, java.util.List, java.util.Collections, java.util.Comparator" %>
<%@ page isELIgnored="false"%>

<%
    Quiz quiz = (Quiz) request.getAttribute("quiz");
    List<Leaderboard> leaderboard = (List<Leaderboard>) request.getAttribute("leaderboard");

    if (leaderboard != null) {
        Collections.sort(leaderboard, new Comparator<Leaderboard>() {
            public int compare(Leaderboard a, Leaderboard b) {
                return b.getScore() - a.getScore();
            }
        });
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Leaderboard</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>
/* RESET */
* { margin:0; padding:0; box-sizing:border-box; }

/* BACKGROUND */
body {
    min-height: 100vh;
    font-family: "Poppins", sans-serif;
    background: linear-gradient(135deg, #0f0f13, #1c1c25, #111119);
    color: #fff;
    padding: 40px 20px;
    display: flex;
    justify-content: center;
}

/* CONFETTI */
.confetti {
    position: fixed;
    width: 6px;
    height: 6px;
    background: #ffcc00;
    border-radius: 2px;
    opacity: 0.4;
    transform: rotate(45deg);
    z-index: -1;
}

/* CONTAINER */
.container {
    width: 100%;
    max-width: 950px;
    background: rgba(255,255,255,0.07);
    backdrop-filter: blur(20px);
    padding: 40px;
    border-radius: 20px;
    box-shadow: 0 0 40px rgba(0,0,0,0.5);
    animation: fadeIn 1s ease;
}

@keyframes fadeIn {
    from { opacity:0; transform:translateY(40px); }
    to   { opacity:1; transform:translateY(0); }
}

/* HEADER */
.header {
    text-align: center;
    margin-bottom: 35px;
}
.quiz-name {
    font-size: 32px;
    font-weight: bold;
    background: linear-gradient(90deg, #ffe259, #ffa751);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    text-shadow:0 0 15px rgba(255,208,88,0.5);
}
.category {
    margin-top: 8px;
    font-size: 18px;
    color: #00eaff;
    font-weight: 600;
}

/* TABLE */
table {
    width: 100%;
    border-collapse: collapse;
    overflow: hidden;
}
thead {
    background: linear-gradient(135deg, #00b7ff, #0077ff);
    color: #fff;
}
th { padding: 14px; font-size: 16px; text-align: left; }
td { padding: 15px; font-size: 15px; border-bottom: 1px solid rgba(255,255,255,0.08); }

/* RANK COLORS */
.rank-1 { background: rgba(255,215,0,0.15); }
.rank-2 { background: rgba(192,192,192,0.15); }
.rank-3 { background: rgba(205,127,50,0.15); }

/* Hover */
tbody tr:hover { background: rgba(0,200,255,0.18); transition:0.3s ease; transform:scale(1.01); }

/* BADGES */
.rank-badge { padding:6px 14px; border-radius:30px; color:#111; font-weight:700; font-size:13px; }
.gold   { background:#FFD700; }
.silver { background:#C0C0C0; }
.bronze { background:#CD7F32; }
.normal { background:#00c6ff; color:#fff; }

/* BACK BUTTON */
.btn-back {
    display: inline-block;
    margin-top: 35px;
    padding: 12px 26px;
    background: linear-gradient(135deg, #ff6a00, #ee0979);
    border-radius: 50px;
    color: #fff;
    text-decoration: none;
    font-weight: bold;
    transition: 0.3s ease;
}
.btn-back:hover {
    transform: scale(1.05);
    box-shadow: 0 0 25px rgba(255,0,100,0.4);
}
</style>

<script>
// Generate static confetti after DOM is loaded
document.addEventListener("DOMContentLoaded", function() {
    for (let i = 0; i < 40; i++) {
        const c = document.createElement("div");
        c.className = "confetti";
        c.style.left = Math.random() * window.innerWidth + "px";
        c.style.top = Math.random() * window.innerHeight + "px";
        c.style.background = ["#ffcc00","#ff6a00","#00c6ff","#00ff88"][Math.floor(Math.random()*4)];
        document.body.appendChild(c);
    }
});
</script>

</head>
<body>

<div class="container">

    <div class="header">
        <div class="quiz-name">
            🎉 LEADERBOARD – <%= quiz.getQuizTitle().toUpperCase() %> 🎉
        </div>
        <div class="category">
            CATEGORY: <%= quiz.getCategory() %>
        </div>
    </div>

    <table>
        <thead>
            <tr>
                <th>RANK</th>
                <th>NAME</th>
                <th>EMAIL</th>
                <th>SCORE</th>
            </tr>
        </thead>
        <tbody>
            <%
                if (leaderboard != null && !leaderboard.isEmpty()) {
                    int rank = 1;
                    for (Leaderboard entry : leaderboard) {
                        String rowClass = "";
                        String badgeClass = "";
                        if (rank == 1) { rowClass = "rank-1"; badgeClass = "gold"; }
                        else if (rank == 2) { rowClass = "rank-2"; badgeClass = "silver"; }
                        else if (rank == 3) { rowClass = "rank-3"; badgeClass = "bronze"; }
                        else { badgeClass = "normal"; }
            %>
            <tr class="<%= rowClass %>">
                <td><span class="rank-badge <%= badgeClass %>">#<%= rank %></span></td>
                <td><%= entry.getUsername() %></td>
                <td><%= entry.getEmail() %></td>
                <td><%= entry.getScore() %></td>
            </tr>
            <%
                        rank++;
                    }
                } else {
            %>
            <tr>
                <td colspan="4" style="text-align:center; padding:20px; color:#ccc;">
                    No attempts yet.
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>

    <a class="btn-back" href="${pageContext.request.contextPath}/user/quizList">← Back to Quiz List</a>

</div>

</body>
</html>
