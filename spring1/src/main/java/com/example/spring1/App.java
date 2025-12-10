package com.example.spring1;

/**
 * Hello world!
 */
public class App {
    public static void main(String[] args) {
        System.out.println("Hello World!");
        ApplicationContext context = AnnotationConfigApplicationContext(Spring);
        		Student s=(Student)context.getBean(Student.class);
        System.out.println(s);
        context.close();
    }
}
