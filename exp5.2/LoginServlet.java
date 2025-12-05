
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        String userName = request.getParameter("username");

        // Create or get existing session
        HttpSession session = request.getSession();
        session.setAttribute("username", userName);

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<meta charset='UTF-8'>");
        out.println("<title>Login Successful</title>");
        out.println("</head>");
        out.println("<body>");

        out.println("<h2>Login Successful</h2>");
        out.println("<p>Hello, " + userName + "!</p>");
        out.println("<p><a href='WelcomeServlet'>Go to Welcome Page</a></p>");

        out.println("</body>");
        out.println("</html>");

        out.close();
    }
}
