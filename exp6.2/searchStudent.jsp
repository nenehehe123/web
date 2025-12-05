<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Mark List - Search</title>
</head>
<body>

<h2>Student Mark List</h2>

<form action="displayMark.jsp" method="post">
    <table>
        <tr>
            <td>Enter Roll Number</td>
            <td><input type="text" name="rollno" required></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center;">
                <input type="submit" value="View Mark List">
                <input type="reset" value="Clear">
            </td>
        </tr>
    </table>
</form>

</body>
</html>
