package com.example;

public class Triangle {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int i;
		for(i=1 ;i <= 4; i++) {
			for(int k =1; k<=4-i;k++)
				System.out.print(" ");
			for(int j=1;j<=i;j++)
				System.out.print("* ");
			System.out.println("");
			
		}
		for(int x=1;x>=3;x--) {
			for(int y =1; y<=4-x;y++)
				System.out.print(" ");
			for(int z = 1 ; z<=x;z++)
				System.out.print("* ");
			System.out.println(" ");
		}

	}

}
