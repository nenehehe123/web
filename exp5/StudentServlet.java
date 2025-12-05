import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        // Read form data
        String name = request.getParameter("name");
        String regno = request.getParameter("regno");
        String dept = request.getParameter("dept");

        // Set response type
        response.setContentType("text/html");

        // Output response
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<meta charset='UTF-8'>");
        out.println("<title>Student Details</title>");
        out.println("</head>");
        out.println("<body>");

        out.println("<h2>Submitted Student Details</h2>");
        out.println("<table border='1' cellpadding='5' cellspacing='0'>");
        out.println("<tr><th>Field</th><th>Value</th></tr>");
        out.println("<tr><td>Name</td><td>" + name + "</td></tr>");
        out.println("<tr><td>Register Number</td><td>" + regno + "</td></tr>");
        out.println("<tr><td>Department</td><td>" + dept + "</td></tr>");
        out.println("</table>");

        out.println("<br><a href='studentForm.html'>Back to Form</a>");

        out.println("</body>");
        out.println("</html>");

        out.close();
    }
}
