<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Examination</title>
</head>
<body>
<h2>Online Examination</h2>

<form action="result.jsp" method="post">

<%
Connection con = null;
Statement stmt = null;
ResultSet rs = null;

String url = "jdbc:mysql://localhost:3306/college";
String user = "root"; 
String pass = "root"; 

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection(url, user, pass);
    stmt = con.createStatement();
    rs = stmt.executeQuery("SELECT * FROM questions");

    int qNo = 1;
    while (rs.next()) {
        int qid = rs.getInt("qid");
%>

<b>Q<%= qNo %>. <%= rs.getString("question") %></b><br>

<input type="radio" name="q<%= qid %>" value="A" required> <%= rs.getString("optionA") %><br>
<input type="radio" name="q<%= qid %>" value="B"> <%= rs.getString("optionB") %><br>
<input type="radio" name="q<%= qid %>" value="C"> <%= rs.getString("optionC") %><br>
<input type="radio" name="q<%= qid %>" value="D"> <%= rs.getString("optionD") %><br>

<br>
<%
        qNo++;
    }
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
} finally {
    try { if (rs != null) rs.close(); } catch (Exception e) {}
    try { if (stmt != null) stmt.close(); } catch (Exception e) {}
    try { if (con != null) con.close(); } catch (Exception e) {}
}
%>

<input type="submit" value="Submit Test">
<input type="reset" value="Clear">

</form>
</body>
</html>
