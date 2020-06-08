/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.model.dao;

import java.sql.Connection;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.Before;

import uts.isd.model.Payment;
import uts.isd.model.Shipping;

/**
 *
 * @author mscov
 */
public class CheckoutDBManagerTest {

    private DBConnector db;
    private Connection conn;
    
    public CheckoutDBManagerTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() throws Exception {
        this.db = new DBConnector();
        this.conn = db.openConnection();              
    }

    @After
    public void tearDown() throws Exception {
    }

    /**
     * Test of insertPayment method, of class CheckoutDBManager.
     */
    @Test
    public void testInsertPayment() throws Exception {
        System.out.println("insertPayment");
        Payment payment = new Payment(123, 0, "Mickey Mouse", "1234-5678-8765-4321", "10/2021", "123");
        CheckoutDBManager instance = new CheckoutDBManager(conn);

        boolean result = instance.insertPayment(payment);
        
        assertTrue(result);
        assertNotNull(payment.getPaymentID());
    }

    /**
     * Test of listPayments method, of class CheckoutDBManager.
     */
    @Test
    public void testListPayments() throws Exception {
        System.out.println("listPayments");
        int customerID = 123;
        CheckoutDBManager instance = new CheckoutDBManager(conn);
        
        List<Payment> result = instance.listPayments(customerID);
        
        assertNotNull(result);
        assertEquals(result.get(0).getCustomerID(), customerID);                
    }

    /**
     * Test of selectPayment method, of class CheckoutDBManager.
     */
    @Test
    public void testSelectPayment() throws Exception {
        System.out.println("selectPayment");
        int paymentID = 1;
        CheckoutDBManager instance = new CheckoutDBManager(conn);
        
        Payment result = instance.selectPayment(paymentID);

        assertNotNull(result);
        assertEquals(result.getPaymentID(), paymentID);
    }

    /**
     * Test of updatePayment method, of class CheckoutDBManager.
     */
    @Test
    public void testUpdatePayment() throws Exception {
        System.out.println("updatePayment");
        Payment payment = new Payment(123, 0, "Mickey Mouse", "1234-5678-8765-4321", "10/2021", "123");
        payment.setPaymentID(1);
        CheckoutDBManager instance = new CheckoutDBManager(conn);

        boolean result = instance.updatePayment(payment);
        assertTrue(result);
    }

    /**
     * Test of deletePayment method, of class CheckoutDBManager.
     */
    @Test
    public void testDeletePayment() throws Exception {
        System.out.println("deletePayment");
        Payment payment = new Payment(123, 0, "Mickey Mouse", "1234-5678-8765-4321", "10/2021", "123");
        CheckoutDBManager instance = new CheckoutDBManager(conn);
        
        //Create a new payment to test delete
        instance.insertPayment(payment);
        
        boolean result = instance.deletePayment(payment);        
        assertTrue(result);
    }
 
   /**
     * Test of insertShipping method, of class CheckoutDBManager.
     */
    @Test
    public void testInsertShipping() throws Exception {
        System.out.println("insertShipping");
        Shipping shipping = new Shipping(123, "123 Main St", null, "Australia", "NSW", "2000");
        CheckoutDBManager instance = new CheckoutDBManager(conn);

        boolean result = instance.insertShipping(shipping);
        assertTrue(result);
        assertNotNull(shipping.getShippingID());
    }

    /**
     * Test of listShippings method, of class CheckoutDBManager.
     */
    @Test
    public void testListShipping() throws Exception {
        System.out.println("listShipping");
        int customerID = 123;
        CheckoutDBManager instance = new CheckoutDBManager(conn);
        List<Shipping> result = instance.listShipping(customerID);
        
        assertNotNull(result);
        assertEquals(result.get(0).getCustomerID(), customerID);                
    }

    /**
     * Test of selectShipping method, of class CheckoutDBManager.
     */
    @Test
    public void testSelectShipping() throws Exception {
        System.out.println("selectShipping");
        int shippingID = 1;
        CheckoutDBManager instance = new CheckoutDBManager(conn);
        
        Shipping result = instance.selectShipping(shippingID);

        assertNotNull(result);
        assertEquals(result.getShippingID(), shippingID);
    }

    /**
     * Test of updateShipping method, of class CheckoutDBManager.
     */
    @Test
    public void testUpdateShipping() throws Exception {
        System.out.println("updateShipping");
        Shipping shipping = new Shipping(123, "123 Main St", null, "New Zealand", null, "1000");
        shipping.setShippingID(1);
        CheckoutDBManager instance = new CheckoutDBManager(conn);

        boolean result = instance.updateShipping(shipping);
        assertTrue(result);
    }

    /**
     * Test of deleteShipping method, of class CheckoutDBManager.
     */
    @Test
    public void testDeleteShipping() throws Exception {
        System.out.println("deleteShipping");
        Shipping shipping = new Shipping(123, "123 Main St", null, "Australia", "TAS", "6000");
        CheckoutDBManager instance = new CheckoutDBManager(conn);
        
        //Create a new shipping to test delete
        instance.insertShipping(shipping);
             
        boolean result = instance.deleteShipping(shipping);        
        assertTrue(result);
    }    
}
