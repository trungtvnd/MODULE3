import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "DictionaryServlet", value = "/Dictionary")
public class DictionaryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        Map<String, String> dictionary = new HashMap<>();
        dictionary.put("hello", "Xin chao");
        dictionary.put("how", "the nao");
        dictionary.put("book", "cuon sach");
        dictionary.put("computer", "may tinh");
        String search = request.getParameter("txtSearch");


        try {
            PrintWriter pw = response.getWriter();
            pw.println("<html>");

            String result = dictionary.get(search);
            if(search != null){
//                pw.println("document.getElementById('result').value" + "=" + result );
                pw.println("Word: " + search);
                pw.println("Result: " + result);
            }else {
                pw.println("Not FOUND");
            }
            pw.println("</html>");

        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
