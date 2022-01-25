package controller;

import model.Student;
import service.StudentService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/students")
public class StudentServlet extends HttpServlet {
    StudentService studentService = new StudentService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(req, resp);
                break;
            case "edit":
                showEditForm(req, resp);
                break;
            case "delete":
                showDeleteFrom(req, resp);
            default:
                listStudent(req, resp);
                break;
        }
    }

    private void showDeleteFrom(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        Student student = this.studentService.findByID(id);
        RequestDispatcher dispatcher;
        if(student == null){
            dispatcher = req.getRequestDispatcher("error-404.jsp");
        } else {
            req.setAttribute("student", student);
            dispatcher = req.getRequestDispatcher("student/delete.jsp");
        }
        try {
            dispatcher.forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        Student student = this.studentService.findByID(id);
        RequestDispatcher requestDispatcher;
        if(student == null){
            requestDispatcher = req.getRequestDispatcher("error-404.jsp");
        }else {
            req.setAttribute("student", student);
            requestDispatcher = req.getRequestDispatcher("student/edit.jsp");
        }
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void showCreateForm(HttpServletRequest req, HttpServletResponse resp) {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/student/create.jsp");
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
            case "create":
                createStudent(req, resp);
                break;
            case "edit":
                editStudent(req, resp);
                break;
            case "delete":
                deleteStudent(req, resp);
                break;
            default:

                break;
        }
    }

    private void deleteStudent(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        Student student = this.studentService.findByID(id);
        RequestDispatcher dispatcher;
        if(student == null){
            dispatcher = req.getRequestDispatcher("error-404.jsp");
        } else {
            this.studentService.remove(id);
            try {
                resp.sendRedirect("/students");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void editStudent(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        int age = Integer.parseInt(req.getParameter("age"));
        String address = req.getParameter("address");
        double avgPoint = Double.parseDouble(req.getParameter("avgPoint"));
        Student student = this.studentService.findByID(id);
        RequestDispatcher requestDispatcher;
        if(student == null){
            requestDispatcher = req.getRequestDispatcher("error.jsp");
        }else {
            student.setName(name);
            student.setAge(age);
            student.setAddress(address);
            student.setAvgPoint(avgPoint);
            this.studentService.update(id, student);
            req.setAttribute("student", student);
            req.setAttribute("message", "Edit successfully");
           requestDispatcher = req.getRequestDispatcher("student/edit.jsp");
        }
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createStudent(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String address = request.getParameter("address");
        double avgPoint = Double.parseDouble(request.getParameter("avgPoint"));

        Student student = new Student(id, name, age, address, avgPoint);
        this.studentService.save(student);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/student/create.jsp");
        request.setAttribute("message", "New Student was created");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public void listStudent(HttpServletRequest request, HttpServletResponse response) {
        List<Student> students = this.studentService.findAll();
        request.setAttribute("students", students);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("student/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
