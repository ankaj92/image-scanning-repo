package com.example;

import java.io.*;
import java.util.*;

public class App {
    public static void main(String[] args) throws Exception {
        // Vulnerable: Hardcoded secret and unsafe file read
        // This is a demonstration of a vulnerable application
        String secret = "hardcoded-password";
        System.out.println("Secret: " + secret);

        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter filename: ");
        String filename = scanner.nextLine();
        BufferedReader reader = new BufferedReader(new FileReader(filename));
        System.out.println("File contents: " + reader.readLine());
        reader.close();
    }
}