/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author mscov
 */
enum CartStatus {
    Active,
    Expired
}

public class Cart {
    //Creating the properties of the cart model
    private int cartID;
    //public int customerID; Dont need until checkout
    private CartStatus status;
    private double cartTotal;
    private List<CartItem> items;
    
    
    
    public Cart() {
        //this.customerID = customerID;
        this.status = CartStatus.Active;
        this.cartTotal = 0.00;
        this.items = new ArrayList<CartItem>(); 
        
    }   

    public int getCartID() {
        return cartID;
    }

    public void setCartID(int cartID) {
        this.cartID = cartID;
    }

    public double getCartTotal() {
        return cartTotal;
    }

    public void setCartTotal(double cartTotal) {
        this.cartTotal = cartTotal;
    } 
    
    public void Add(CartItem cartItem) {
        //Add the passed cartItem to cart
        items.add(cartItem);
        //Update cartTotal
        calculateTotal();
    }
    
    public void Remove(int cartItemID){
        //Remove the specified item from the cart
        items.remove(cartItemID);
        //Update CartTotal
        calculateTotal();
        
    }

    public List<CartItem> getItems() {
        return items;
    }
    
    public CartItem getCartItem(int cartItemID){
        //Loop through cartItems looking for 
        for (CartItem cartItem : this.getItems()) {
            //Test if cartItem is one we are lookin for
            if (cartItem.getItemID() == cartItemID){
                return cartItem;
            }
        }
        return null;
    }
    
    public void calculateTotal(){
        cartTotal = 0;
        for (CartItem cartItem : this.getItems()) {
            //Calculate total price
             cartTotal = cartTotal + (cartItem.getQuantity() * cartItem.getPrice());
        }
        
    }
    
    public int numOfItems(){
        //Returns the number of items in the cart in an integer format
        int numOfItems = items.size();
        return numOfItems;
    }
    
}
