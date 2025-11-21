package com.example;

import java.util.Scanner;

public class SwitchCalculator {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		System.out.println("Enter your first no:");
		int fno = scanner.nextInt();
		System.out.println("Enter your first no:");
		int sno = scanner.nextInt();
		System.out.println("enter the arithmetic operation");
		char op= scanner.next().charAt(0);
		
		
		switch(op) {
		case '+' : System.out.println(fno + sno);
		break;
		case '-' : System.out.println(fno - sno);
		break;
		case '*' : System.out.println(fno * sno);
		break;
		case '%' : System.out.println((float)fno % sno);
		break;
		case '/' : System.out.println((float)fno / sno);
		break;
		default:System.out.println("not a valid operation");
		
		
		
		}

	}

}
