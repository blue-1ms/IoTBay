/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypack;

import java.io.Serializable;

public class catalogue implements Serializable {
    
    //private properties
   private int productID;
    private String productName;
    private String productType;
    private String productDescription;
    private double productPrice;
    private int productQuantity;
    private String productAvailiability;

    public catalogue(int productID, String productName, String productType, String productDescription, 
            double productPrice, int productQuantity, String productAvailiability) {
        this.productID = productID;
        this.productName = productName;
        this.productType = productType;
        this.productDescription = productDescription;
        this.productPrice = productPrice;
        this.productQuantity = productQuantity;
        this.productAvailiability = productAvailiability;
       
    }

    public int getProductID() {
        return productID;
    }

    public String getProductName() {
        return productName;
    }

    public String getProductType() {
        return productType;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public int getProductQuantity() {
        return productQuantity;
    }

    public String getProductAvailiability() {
        return productAvailiability;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public void setProductType(String productType) {
        this.productType = productType;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }

    public void setProductAvailiability(String productAvailiability) {
        this.productAvailiability = productAvailiability;
    }

   
    
}

