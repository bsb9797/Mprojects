package com.example;

import java.util.Scanner;

public class PrintName {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		char choice ='Y';
		Scanner sc= new Scanner(System.in);
		do {
			System.out.println("RAVI");
			System.out.println("do u wanna repeat Y/N");
			choice=sc.next().charAt(0);
			
		}while(choice != 'N');
		System.out.println("THANK YOU...");

	}

}
