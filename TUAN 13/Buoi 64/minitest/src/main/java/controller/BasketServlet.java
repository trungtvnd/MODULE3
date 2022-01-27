package controller;

import model.Basket;
import service.BasketService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(urlPatterns = "/baskets")
public class BasketServlet extends HttpServlet {
    BasketService basketService = new BasketService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action==null){
            action="";
        }
        switch (action){
            case "":
                break;
            case "addProductGet":
                addProductGet(req, resp);
                break;
            default:
                listBasket(req, resp);
                break;
        }
    }

    private void addProductGet(HttpServletRequest req, HttpServletResponse resp) {
        String name = req.getParameter("name");
        double price = Double.parseDouble(req.getParameter("price"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        Basket basket = new Basket(name, price, quantity);
        basketService.create(basket);
        req.setAttribute("basket", basketService.display());
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("product/viewBasket");

    }

    private void listBasket(HttpServletRequest req, HttpServletResponse resp) {
        ArrayList<Basket> baskets = basketService.display();
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("product/viewBasket.jsp");
        req.setAttribute("baskets", baskets);
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
