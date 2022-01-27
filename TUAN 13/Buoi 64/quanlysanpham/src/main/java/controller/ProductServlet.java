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
    private static  ProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String action = req.getParameter("action");
    if(action==null){
        action="";
    }
    switch (action){
        case "create":
            createGet(req, resp);
            break;
        case "edit":
            editGet(req,resp);
            break;
        case "delete":
            deleteGet(req, resp);
            break;
        case "sort":
            sortGet(req, resp);
        default:
            displayProduct(req, resp);
            break;
    }
    }
    private void sortGet(HttpServletRequest req, HttpServletResponse resp) {
        ArrayList<Product> products = productService.sortByPrice();
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("product/list.jsp");
        req.setAttribute("products", products);
        try{
            requestDispatcher.forward(req,resp);
        }catch (ServletException e){
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }

    }

    private void deleteGet(HttpServletRequest req, HttpServletResponse resp) {

        int id = Integer.parseInt(req.getParameter("id"));
        Product product = productService.findById(id);
        RequestDispatcher requestDispatcher;
        if(product==null){
            requestDispatcher = req.getRequestDispatcher("error-404.jsp");
        }else {
            req.setAttribute("product", product);
            requestDispatcher = req.getRequestDispatcher("product/delete.jsp");
        }
        try {
            requestDispatcher.forward(req, resp);
        }catch (ServletException e){
            e.printStackTrace();
        }catch (IOException e ){
            e.printStackTrace();
        }
    }

    private void editGet(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        RequestDispatcher requestDispatcher ;
        if(productService.findById(id) !=null){
            req.setAttribute("product", productService.findById(id));
            requestDispatcher = req.getRequestDispatcher("product/edit.jsp");
        }else {
            requestDispatcher = req.getRequestDispatcher("error-404.jsp");
        }
        try {
            requestDispatcher.forward(req, resp);
        }catch (ServletException e){
            e.printStackTrace();
        }catch (IOException e ){
            e.printStackTrace();
        }
        
    }

    private void createGet(HttpServletRequest req, HttpServletResponse resp) {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("product/create.jsp");
        try {
            requestDispatcher.forward(req, resp);
        }catch (ServletException e){
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }
    }

    private void displayProduct(HttpServletRequest req, HttpServletResponse resp) {
        ArrayList<Product> products = productService.display();
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("product/list.jsp");
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
        switch (action){
            case "create":
                createPost(req, resp);
                break;
            case "edit":
                editPost(req,resp);
                break;
            case "delete":
                deletePost(req, resp);

                break;
        }
    }



    private void deletePost(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = productService.findById(id);
        RequestDispatcher requestDispatcher;
        if(product== null){
            requestDispatcher = req.getRequestDispatcher("error-404.jsp");
        }else {
            productService.delete(product);
        }
        try {
            resp.sendRedirect("/products");
        }catch (IOException e ){
            e.printStackTrace();
        }
    }

    private void editPost(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        double price = Double.parseDouble(req.getParameter("price"));
        String describe = req.getParameter("describe");
        String manufacturer = req.getParameter("manufacturer");
        RequestDispatcher requestDispatcher;
        if(productService.findById(id) == null){
            requestDispatcher = req.getRequestDispatcher("error-404.jsp");
        }else {
            productService.findById(id).setName(name);
            productService.findById(id).setPrice(price);
            productService.findById(id).setDescribe(describe);
            productService.findById(id).setManufacturer(manufacturer);
            int index = -1;
            ArrayList<Product> products = productService.display();
            for (int i = 0; i < products.size(); i++) {
                if (products.get(i).getId() == productService.findById(id).getId()) {
                    index = i;
                }
            }
            productService.edit(index,productService.findById(id));
            req.setAttribute("product", productService.findById(id));
            requestDispatcher = req.getRequestDispatcher("product/edit.jsp");
        }
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createPost(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        double price = Double.parseDouble(req.getParameter("price"));
        String describe = req.getParameter("describe");
        String manufacturer = req.getParameter("manufacturer");
        Product product = new Product(id, name, price, describe, manufacturer);
        productService.create(product);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("product/create.jsp");
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
