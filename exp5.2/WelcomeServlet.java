
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/WelcomeServlet")
public class WelcomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
                         throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(false); // don't create new session

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<meta charset='UTF-8'>");
        out.println("<title>Welcome</title>");
        out.println("</head>");
        out.println("<body>");

        if (session != null) {
            String userName = (String) session.getAttribute("username");

            if (userName != null) {
                out.println("<h2>Welcome, " + userName + "!</h2>");
                out.println("<p>Your Session ID: " + session.getId() + "</p>");
            } else {
                out.println("<h2>No user information found in session.</h2>");
            }
        } else {
            out.println("<h2>Session expired or not found. Please login again.</h2>");
        }

        out.println("</body>");
        out.println("</html>");

        out.close();
    }
}
