import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ProductDiscount", value = "/Discount")
public class ProductDiscount extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        double price = Double.parseDouble(req.getParameter("price"));
        double discount = Double.parseDouble(req.getParameter("discount"));

        double amountDiscount = price * discount * 0.01;
        double priceDiscount = price - amountDiscount;

        PrintWriter pw = resp.getWriter();
        pw.println("<html>");
        pw.println("Amount Discount is: " + amountDiscount);
        pw.println("Price after discount is: " + priceDiscount);
        pw.println("</html>");
    }
}
