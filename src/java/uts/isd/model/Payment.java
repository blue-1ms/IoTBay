/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.model;

/**
 *
 * @author mscov
 */
public class Payment {
    //Defining elements of the model class
    private int paymentID;
    private int customerID;
    private int paymentType;
    private String cardName;
    private String cardNumber;
    private String cardExpiry;
    private String cardCVV;
    
    //Constructors
    public Payment() {
    }

    public Payment(int customerID, int paymentType, String cardName, String cardNumber, String cardExpiry, String cardCVV) {
        this.customerID = customerID;
        this.paymentType = paymentType;
        this.cardName = cardName;
        this.cardNumber = cardNumber;
        this.cardExpiry = cardExpiry;
        this.cardCVV = cardCVV;
    }

    
    //Getters and Setters for the defined model elements
    public int getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(int paymentID) {
        this.paymentID = paymentID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public int getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(int paymentType) {
        this.paymentType = paymentType;
    }

    public String getCardName() {
        return cardName;
    }

    public void setCardName(String cardName) {
        this.cardName = cardName;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getCardExpiry() {
        return cardExpiry;
    }

    public void setCardExpiry(String cardExpiry) {
        this.cardExpiry = cardExpiry;
    }

    public String getCardCVV() {
        return cardCVV;
    }

    public void setCardCVV(String cardCVV) {
        this.cardCVV = cardCVV;
    }
    
    //Getter to mask cardNumber
    public String getMaskedCardNumber(){
        String maskedCardNumber = cardNumber.substring(0,3) + "-****-****-" + cardNumber.substring(cardNumber.length()-4,cardNumber.length());
        return maskedCardNumber;
    }
    
}
