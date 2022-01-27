package controller;

import model.City;
import service.CityService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(urlPatterns = "/cities")
public class CityServlet extends HttpServlet {
    private  final CityService cityService = new CityService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createGet(req, resp);
                break;
            case "edit":
                editGet(req, resp);
                break;
            case "delete":
                deleteGet(req, resp);
                break;
            case "view":
                view(req, resp);
                break;
            default:
                displayCity(req, resp);
                break;
        }
    }

    private void view(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        City city = cityService.findById(id);
        RequestDispatcher requestDispatcher;
        if(city==null){
            requestDispatcher = req.getRequestDispatcher("error-404.jsp");
        }else {
            req.setAttribute("city", city);
            requestDispatcher = req.getRequestDispatcher("city/viewCity.jsp");
        }
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteGet(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        City city = cityService.findById(id);
        RequestDispatcher requestDispatcher;
        if(city==null){
            requestDispatcher = req.getRequestDispatcher("error-404.jsp");
        }else {
            req.setAttribute("cities", city);
            requestDispatcher = req.getRequestDispatcher("city/delete.jsp");
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
        City city = cityService.findById(id);
        RequestDispatcher requestDispatcher;
        if (city == null) {
            requestDispatcher = req.getRequestDispatcher("error-404.jsp");
        } else {
            req.setAttribute("cities", city);
            requestDispatcher = req.getRequestDispatcher("city/edit.jsp");
        }
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void createGet(HttpServletRequest req, HttpServletResponse resp) {
        ArrayList<String> countries = cityService.getCountries();
        req.setAttribute("country", countries);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("city/create.jsp");

        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void displayCity(HttpServletRequest req, HttpServletResponse resp) {
        ArrayList<City> cities = cityService.display();
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("city/view.jsp");
        req.setAttribute("cities", cities);
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "createPost":
                createPost(req, resp);
                break;
            case "edit":
                editPost(req, resp);
                break;
            case "delete":
                deletePost(req, resp);
                break;
        }
    }

    private void deletePost(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
       City city = cityService.findById(id);
        RequestDispatcher requestDispatcher;
        if(city== null){
            requestDispatcher = req.getRequestDispatcher("error-404.jsp");
        }else {
            cityService.delete(city);
        }
        try {
            resp.sendRedirect("/cities");
        }catch (IOException e ){
            e.printStackTrace();
        }
    }

    private void editPost(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        double area = Double.parseDouble(req.getParameter("area"));
        int population = Integer.parseInt(req.getParameter("population"));
        double gdp = Double.parseDouble(req.getParameter("gdp"));
        String country = req.getParameter("country");
        City city = cityService.findById(id);
        RequestDispatcher requestDispatcher;

        if (city == null) {
            requestDispatcher = req.getRequestDispatcher("error-404.jsp");
        } else {
            city.setName(name);
            city.setArea(area);
            city.setPopulation(population);
            city.setGdp(gdp);
            city.setCountry(country);
            int index = -1;
            ArrayList<City> cities = cityService.display();
            for (int i = 0; i < cities.size(); i++) {
                if (cities.get(i).getId() == id) {
                    i = index;
                }
            }
            cityService.edit(index, city);
            req.setAttribute("city", city);
            requestDispatcher = req.getRequestDispatcher("city/edit.jsp");
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
        double area = Double.parseDouble(req.getParameter("area"));
        int population = Integer.parseInt(req.getParameter("population"));
        double gdp = Double.parseDouble(req.getParameter("gdp"));
        String country = req.getParameter("country");
        City city = new City(id, name, area, population, gdp, country);
        cityService.create(city);
        req.setAttribute("cities", cityService.display());
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("city/view.jsp");
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
