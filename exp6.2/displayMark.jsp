<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Mark List</title>
</head>
<body>

<h2>Student Mark List</h2>

<%
String roll = request.getParameter("rollno");

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

String url = "jdbc:mysql://localhost:3306/college";
String user = "root";   // change as per database
String pass = "root";   // change as per database

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection(url, user, pass);

    String query = "SELECT * FROM student_marks WHERE rollno = ?";
    ps = con.prepareStatement(query);
    ps.setString(1, roll);

    rs = ps.executeQuery();

    if (rs.next()) {

        String name = rs.getString("name");
        String dept = rs.getString("dept");
        int m1 = rs.getInt("sub1");
        int m2 = rs.getInt("sub2");
        int m3 = rs.getInt("sub3");

        int total = m1 + m2 + m3;
        float average = total / 3.0f;

        String grade;
        if (average >= 90) grade = "A+";
        else if (average >= 80) grade = "A";
        else if (average >= 70) grade = "B";
        else if (average >= 60) grade = "C";
        else grade = "D";
%>

<table border="1" cellpadding="5" cellspacing="0">
    <tr><th>Roll Number</th><td><%= roll %></td></tr>
    <tr><th>Name</th><td><%= name %></td></tr>
    <tr><th>Department</th><td><%= dept %></td></tr>
    <tr><th>Subject 1</th><td><%= m1 %></td></tr>
    <tr><th>Subject 2</th><td><%= m2 %></td></tr>
    <tr><th>Subject 3</th><td><%= m3 %></td></tr>
    <tr><th>Total</th><td><%= total %></td></tr>
    <tr><th>Average</th><td><%= average %></td></tr>
    <tr><th>Grade</th><td><%= grade %></td></tr>
</table>

<%
    } else {  // If no record
%>
        <p>No record found for Roll Number: <b><%= roll %></b></p>
<%
    }

} catch (Exception e) {
    out.println("Error: " + e.getMessage());
} finally {
    try { if (rs != null) rs.close(); } catch (Exception e) {}
    try { if (ps != null) ps.close(); } catch (Exception e) {}
    try { if (con != null) con.close(); } catch (Exception e) {}
}
%>

<br>
<a href="searchStudent.jsp">Search Another Student</a>

</body>
</html>
