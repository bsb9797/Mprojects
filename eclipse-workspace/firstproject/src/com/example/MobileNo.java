package com.example;

import java.util.Scanner;

public class MobileNo {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("Enter your mobile no:");
		String mobileno = scanner.next();
		
		if(mobileno.matches("[6-9]\\d{9}")) 
			System.out.println("calling....");
		
		else 
			System.out.println("not a valid mobile number");
		
		
	}
	

}
