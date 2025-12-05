<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Exam Result</title>
</head>
<body>

<h2>Online Examination Result</h2>

<%
Connection con = null;
Statement stmt = null;
ResultSet rs = null;

String url = "jdbc:mysql://localhost:3306/college";
String user = "root";
String pass = "root";

int totalQuestions = 0;
int correctAnswers = 0;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection(url, user, pass);
    stmt = con.createStatement();
    rs = stmt.executeQuery("SELECT * FROM questions");

    while (rs.next()) {
        int qid = rs.getInt("qid");
        String correctOption = rs.getString("correct_option");

        String selected = request.getParameter("q" + qid);

        if (selected != null) {
            totalQuestions++;
            if (selected.equalsIgnoreCase(correctOption)) {
                correctAnswers++;
            }
        }
    }

} catch (Exception e) {
    out.println("Error: " + e.getMessage());
} finally {
    try { if (rs != null) rs.close(); } catch (Exception e) {}
    try { if (stmt != null) stmt.close(); } catch (Exception e) {}
    try { if (con != null) con.close(); } catch (Exception e) {}
}
%>

<p>Total Questions Attempted : <%= totalQuestions %></p>
<p>Correct Answers : <%= correctAnswers %></p>
<p>Your Score : <%= correctAnswers %> / <%= totalQuestions %></p>

</body>
</html>
