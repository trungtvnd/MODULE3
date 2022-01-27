package controller;

import model.Product;
import service.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(urlPatterns = "/products")
public class ProductServlet extends HttpServlet {
    private final ProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action==null){
            action="";
        }
        switch (action){
            case "viewProduct":
                viewProduct(req, resp);
                break;
            case "sortGet":
                sortGet(req, resp);
                break;
            case "addProductGet":
                addProductGet(req, resp);
                break;
            default:
                displayProduct(req, resp);
                break;
        }
    }

    private void addProductGet(HttpServletRequest req, HttpServletResponse resp) {
        try {
            resp.sendRedirect("/baskets");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void displayProduct(HttpServletRequest req, HttpServletResponse resp) {
        ArrayList<Product> products = productService.display();
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("product/view.jsp");
        req.setAttribute("products", products);
        try{
            requestDispatcher.forward(req,resp);
        }catch (ServletException e){
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }
    }

    private void viewProduct(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = productService.findById(id);
        RequestDispatcher requestDispatcher;
        if(product==null){
            requestDispatcher = req.getRequestDispatcher("error-404.jsp");
        }else {
            req.setAttribute("product", product);
            requestDispatcher = req.getRequestDispatcher("product/viewProduct.jsp");
        }
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void sortGet(HttpServletRequest req, HttpServletResponse resp) {
        ArrayList<Product> products = productService.sortByPrice();
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("product/view.jsp");
        req.setAttribute("products", products);
        try{
            requestDispatcher.forward(req,resp);
        }catch (ServletException e){
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action==null){
            action="";
        }
    }


}
