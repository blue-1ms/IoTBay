/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author mscov
 */
public class ValidatorTest {
    
    public ValidatorTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of validate method, of class Validator.
     */
    @Test
    public void testValidate() {
        System.out.println("validate");
        String pattern = ".*contains.*";
        Validator instance = new Validator();

        assertTrue(instance.validate(pattern, "this text has the word contains in it"));
        assertFalse(instance.validate(pattern, "this text does not"));
    }

    /**
     * Test of checkEmpty method, of class Validator.
     */
    @Test
    public void testCheckEmpty() {
        System.out.println("checkEmpty");
        Validator instance = new Validator();
        
        assertTrue(instance.checkEmpty(""));
        assertFalse(instance.checkEmpty("not empty"));
    }

    /**
     * Test of validateEmail method, of class Validator.
     */
    @Test
    public void testValidateEmail() {
        System.out.println("validateEmail");
        Validator instance = new Validator();

        assertTrue(instance.validateEmail("chuck.norris@email.com.au"));
        assertFalse(instance.validateEmail("chuck.norris.email.com.au"));
    }

    /**
     * Test of validateName method, of class Validator.
     */
    @Test
    public void testValidateName() {
        System.out.println("validateName");
        Validator instance = new Validator();

        assertTrue(instance.validateName("Chuck Norris"));
        assertFalse(instance.validateName("99999999999"));
    }

    /**
     * Test of validatePassword method, of class Validator.
     */
    @Test
    public void testValidatePassword() {
        System.out.println("validatePassword");
        Validator instance = new Validator();

        assertTrue(instance.validatePassword("Password123"));
        assertFalse(instance.validatePassword("123"));
    }

    /**
     * Test of validateCreditCardName method, of class Validator.
     */
    @Test
    public void testValidateCreditCardName() {
        System.out.println("validateCreditCardName");
        Validator instance = new Validator();

        assertTrue(instance.validateCreditCardName("Chuck Norris"));
        assertFalse(instance.validateCreditCardName("99999999999"));
    }

    /**
     * Test of validateCreditCardNumber method, of class Validator.
     */
    @Test
    public void testValidateCreditCardNumber() {
        System.out.println("validateCreditCardNumber");
        Validator instance = new Validator();

        assertTrue(instance.validateCreditCardNumber("1234-5678-8765-4321"));
        assertFalse(instance.validateCreditCardNumber("9999"));
    }

    /**
     * Test of validateCreditCardExpiration method, of class Validator.
     */
    @Test
    public void testValidateCreditCardExpiration() {
        System.out.println("validateCreditCardExpiration");
        Validator instance = new Validator();

        assertTrue(instance.validateCreditCardExpiration("10/2023"));
        assertFalse(instance.validateCreditCardExpiration("10-2023"));
        assertFalse(instance.validateCreditCardExpiration("10/23"));
    }

    /**
     * Test of validateCreditCardCVV method, of class Validator.
     */
    @Test
    public void testValidateCreditCardCVV() {
        System.out.println("validateCreditCardCVV");
        Validator instance = new Validator();
        
        assertTrue(instance.validateCreditCardCVV("123"));
        assertFalse(instance.validateCreditCardCVV("ABC"));
        assertFalse(instance.validateCreditCardCVV("12345"));
    }
    
}
