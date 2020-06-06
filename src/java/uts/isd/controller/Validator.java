/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

/**
 *
 * @author mscov
 */
 import java.io.Serializable;
 import java.util.regex.Matcher;
 import java.util.regex.Pattern;


 public class Validator implements Serializable{ 

 
   private String emailPattern = "([a-zA-Z0-9]+)(([._-])([a-zA-Z0-9]+))*(@)([a-z]+)(.)([a-z]{3})((([.])[a-z]{0,2})*)";      
   private String namePattern = "([A-Z][a-z]+[\\s])+[A-Z][a-z]*";       
   private String passwordPattern = "[A-Za-z0-9]{4,}";
   private String creditCardNumberPattern = "^(\\d{4}[- ]){3}\\d{4}|\\d{16}$";
   private String ExpirationNumberPattern = "^((0[1-9])|(1[0-2]))\\/*((20[2-9][0-9]))$";
   private String CVVNumberPattern = "^[0-9]{3,4}$";
   
              
   public Validator(){    }       


   public boolean validate(String pattern, String input){       
      Pattern regEx = Pattern.compile(pattern);       
      Matcher match = regEx.matcher(input);       

      return match.matches(); 

   }       

   public boolean checkEmpty(String email, String password){       

      return  email.isEmpty() || password.isEmpty();   

   }

   
   public boolean validateEmail(String email){                       

      return validate(emailPattern,email);   

   }

       
   public boolean validateName(String name){

      return validate(namePattern,name); 

   }       
   

   public boolean validatePassword(String password){

      return validate(passwordPattern,password); 

   }
   
    public boolean validateCreditCardName(String creditCardName){

      return validate(namePattern,creditCardName); 

   }   
   public boolean validateCreditCardNumber(String creditCardNumber){

        return validate(creditCardNumberPattern,creditCardNumber); 

   }
   public boolean validateCreditCardExpiration(String creditCardExpiration){

        return validate(ExpirationNumberPattern,creditCardExpiration); 
   }
   
   public boolean validateCreditCardCVV(String creditCardCVV){

      return validate(CVVNumberPattern,creditCardCVV); 

   }   
}