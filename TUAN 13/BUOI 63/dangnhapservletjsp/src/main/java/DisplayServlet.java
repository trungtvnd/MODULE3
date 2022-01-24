import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(urlPatterns= "/display")
public class DisplayServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Customer> customers = new ArrayList<>();

        customers.add(new Customer("Kien", "01-01-2003", "TH"));
        customers.add(new Customer("Tu", "01-01-1998", "HN"));
        customers.add(new Customer("Sang", "01-01-1992", "LS"));
        customers.add(new Customer("Mai", "01-01-1992", "HN"));
        customers.add(new Customer("Trung", "01-01-1992", "ND"));

        request.setAttribute("customerList", customers);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("display.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
