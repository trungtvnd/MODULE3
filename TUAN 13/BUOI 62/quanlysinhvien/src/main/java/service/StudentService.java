package service;

import model.Student;

import java.util.ArrayList;

public class StudentService {
    private static ArrayList<Student> students;
    static {
        students = new ArrayList<>();
        students.add(new Student(1, "sang", 30));
        students.add(new Student(2, "Tu", 25));
        students.add(new Student(3, "Trung", 30));
    }

    public void create(Student student){
        students.add(student);
    }

    public void edit(int index, Student student){
        students.set(index, student);
    }

    public void delete(Student student){
        students.remove(student);
    }

    public ArrayList<Student> display(){
        return students;
    }

    public Student findById(int id){
        for (Student student:students) {
            if(student.getId() == id){
                return student;
            }
        }return null;
    }

}
