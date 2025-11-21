package com.example;

import java.util.Scanner;

public class Prime {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("enter a number");
		Scanner scanner= new Scanner(System.in);
		int num = scanner.nextInt();
		int count = 0;
		for (int i=2;i<=num/2;i++) {
			if(num%i==0)
				count++;
			break;
		}
			if(count!=0)
				System.out.println("not prime");
			else
				System.out.println("prime");
			
		}

	}

