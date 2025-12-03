package com.example.ui;

import java.util.InputMismatchException;
import java.util.Scanner;
 
public class ConsoleHelper {
 
    private final Scanner scanner = new Scanner(System.in);
 
    public void printHeader(String title) {
        System.out.println("+------------------------------------------+");
        System.out.println("  " + title);
        System.out.println("+------------------------------------------+");
    }
 
    public void println(String msg) {
        System.out.println(msg);
    }
 
    public void print(String msg) {
        System.out.print(msg);
    }
 
    public int readInt(String prompt) {
        while (true) {
            try {
                System.out.print(prompt);
                int value = scanner.nextInt();
                scanner.nextLine(); // clear newline
                return value;
            } catch (InputMismatchException e) {
                scanner.nextLine();
                System.out.println("Please enter a valid integer.");
            }
        }
    }
 
    public double readDouble(String prompt) {
        while (true) {
            try {
                System.out.print(prompt);
                double value = scanner.nextDouble();
                scanner.nextLine();
                return value;
            } catch (InputMismatchException e) {
                scanner.nextLine();
                System.out.println("Please enter a valid number.");
            }
        }
    }
 
    public String readString(String prompt) {
        System.out.print(prompt);
        return scanner.nextLine();
    }
 
    public char readChar(String prompt) {
        while (true) {
            System.out.print(prompt);
            String line = scanner.nextLine();
            if (line.length() == 1) {
                return line.charAt(0);
            }
            System.out.println("Please enter a single character.");
        }
    }
 
    public void printTableSeparator() {
        System.out.println("------------------------------------------------------------");
    }
}