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

public class Product {
    
    //private properties
    private int productID;
    private String productName;
    private String productType;
    private int productQuantity;
    private String productStatus;
    private boolean productAvailiability;

    public Product(int productID, String productName, String productType, int productQuantity, String productStatus, boolean productAvailiability) {
        this.productID = productID;
        this.productName = productName;
        this.productType = productType;
        this.productQuantity = productQuantity;
        this.productStatus = productStatus;
        this.productAvailiability = productAvailiability;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductType() {
        return productType;
    }

    public void setProductType(String productType) {
        this.productType = productType;
    }

    public int getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }

    public String getProductStatus() {
        return productStatus;
    }

    public void setProductStatus(String productStatus) {
        this.productStatus = productStatus;
    }

    public boolean isProductAvailiability() {
        return productAvailiability;
    }

    public void setProductAvailiability(boolean productAvailiability) {
        this.productAvailiability = productAvailiability;
    }
    
}
