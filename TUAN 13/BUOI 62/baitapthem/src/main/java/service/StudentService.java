package service;

import model.Student;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

public class StudentService {
    private static Map<Integer, Student> students;

    static {
        students = new HashMap<>();
        students.put(1,new Student(1, "Kien", 19, "TH", 9));
        students.put(2,new Student(2, "Tu", 24, "HN", 8));
        students.put(3,new Student(3, "Mai", 30, "LS", 7));
        students.put(4,new Student(4, "Sang", 30, "HN", 6));
        students.put(5,new Student(5, "Trung", 30, "ND", 5));
    }

    public ArrayList<Student> findAll(){
        return new ArrayList<>(students.values());
    }

    public void save(Student student){
        students.put(student.getId(),student);
    }

    public Student findByID(int id){
        return students.get(id);
    }

    public void update(int id, Student student){
        students.put(id, student);
    }

    public void remove(int id){
        students.remove(id);
    }

}
