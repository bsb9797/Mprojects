package com.example;

import java.util.Scanner;

public class PrintReverse {

	public static void main(String[] args) {
		// TODO Auto-generated method stub\
		System.out.println("enter a number");
		Scanner scanner= new Scanner(System.in);
		int num = scanner.nextInt();
		int rem,rev=0;
		
		while(num>0) {
			rem= num%10;
			rev=rev*10+rem;
			num=num/10;
		}
		
		System.out.println(rev);
		

	}

}
