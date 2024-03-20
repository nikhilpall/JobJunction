
package com.nikhil.backend;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ValidationServerSide {
    // properties
    private static Pattern namePattern;
    private static Pattern emailPattern;
    private static Pattern passPattern;
    
    private static Matcher nameMatcher;
    private static Matcher emailMatcher;
    private static Matcher passMatcher;
    
    private static String nameRegex = "^[A-Za-z\\-']{3,19}( [A-Za-z\\-']{3,19})*$";
    private static String emailRegex = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
    private static String passRegex = "^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,}$";

    // Constructor
    public ValidationServerSide() {
        namePattern = Pattern.compile(nameRegex);
        emailPattern = Pattern.compile(emailRegex);
        passPattern = Pattern.compile(passRegex);
    }

    // All validations methods
    public static boolean isValidName(String name) {
        nameMatcher = namePattern.matcher(name);
        return nameMatcher.matches();
    }

    public static boolean isValidEmail(String email) {
        emailMatcher = emailPattern.matcher(email);
        return emailMatcher.matches();
    }

    public static boolean isValidPassword(String password) {
        passMatcher = passPattern.matcher(password);
        return passMatcher.matches();
    }
}
