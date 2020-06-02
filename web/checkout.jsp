<%-- 
    Document   : checkout
    Created on : 26/05/2020, 6:03:33 PM
    Author     : mscov
--%>

<%@page import="uts.isd.model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    //Cart Handling
    Cart cart = (Cart) session.getAttribute("cart");
    //Check for error message
    String paymentError = (String) request.getAttribute("PaymentError");

    //Check for shipping
    String billingError = (String) request.getAttribute("BillingError");

%>

<html>
    <head>
        <title>Cart</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    </head>  
    <body>
        
        <style>
            .logo {width: 150px;}
            .divFloat{display: flex;
                      justify-content: flex-end;
                      flex-direction: row;
                      padding: 50px 0px;
            }
            .checkoutHeader{display: inline-block; margin-right: auto;}
            .checkoutBody{display: inline-block; float: right;}
        </style>

        <div class="container mt-4">
            <div class="divFloat">
                <div class="checkoutHeader">
                    <a href="cart.jsp">< Go Back</a>
                </div>
                <div class="checkoutBody">
                    <a href="index.jsp" class="logolink"><img class="logo" src="images/IoTBay.png" alt="logo"></a>
                </div>
            </div>
            <div class="row">

                <div class="col-md-4 order-md-2 mb-4">
                    <h4 class="d-flex justify-content-between align-items-center mb-3">
                        <span class="text-muted">Your cart</span>
                        <!-- Update the pill badge with the number of items in cart -->
                        <span class="badge badge-secondary badge-pill"><%=cart.numOfItems()%></span>
                    </h4>
                    <ul class="list-group mb-3">

                        <!-- Loop through each item in the cart -->
                        <% for (CartItem cartItem : cart.getItems()) {%>
                        <li class="list-group-item d-flex justify-content-between lh-condensed">
                            <div>
                                <h6 class="my-0"><%= cartItem.getProductID()%></h6>
                                <small class="text-muted">Brief description</small>
                            </div>
                            <span class="text-muted">$<%= cartItem.getPrice()%> </span>
                        </li>
                        <% }%>

                        <li class="list-group-item d-flex justify-content-between">
                            <span>Total</span>
                            <strong>$<%= cart.getCartTotal()%></strong>
                        </li>
                    </ul>
                </div>


                <div class="col-md-8 order-md-1">
                    <form class="needs-validation" method="post" action="checkout">
                        <h4 class="mb-3">Billing address</h4>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="firstName">First name</label>
                                <input type="text" class="form-control" id="firstName" placeholder="" value="" required="">
                                <div class="invalid-feedback">
                                    Valid first name is required.
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="lastName">Last name</label>
                                <input type="text" class="form-control" id="lastName" placeholder="" value="" required="">
                                <div class="invalid-feedback">
                                    Valid last name is required.
                                </div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" placeholder="you@example.com" required="">
                            <div class="invalid-feedback">
                                Please enter a valid email address for shipping updates.
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="address">Address</label>
                            <input type="text" class="form-control" id="address" placeholder="1234 Main St" required="">
                            <div class="invalid-feedback">
                                Please enter your shipping address.
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="address2">Address 2 <span class="text-muted">(Optional)</span></label>
                            <input type="text" class="form-control" id="address2" placeholder="Apartment or suite">
                        </div>

                        <div class="row">
                            <div class="col-md-5 mb-3">
                                <label for="country">Country</label>
                                <select class="custom-select d-block w-100" id="country" required="">
                                    <option value="">Choose...</option>
                                    <option>Australia</option>
                                </select>
                                <div class="invalid-feedback">
                                    Please select a valid country.
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="state">State</label>
                                <select class="custom-select d-block w-100" id="state" required="">
                                    <option value="">Choose...</option>
                                    <option>NSW</option>
                                    <option>ACT</option>
                                    <option>SA</option>
                                    <option>VIC</option>
                                    <option>WA</option>
                                    <option>QLD</option>
                                    <option>TAS</option>
                                </select>
                                <div class="invalid-feedback">
                                    Please provide a valid state.
                                </div>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="zip">Post Code</label>
                                <input type="text" class="form-control" id="zip" placeholder="" required="">
                                <div class="invalid-feedback">
                                    Post code required.
                                </div>
                            </div>
                        </div>
                        <hr class="mb-4">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="same-address">
                            <label class="custom-control-label" for="same-address">Shipping address is the same as my billing address</label>
                        </div>
                        <hr class="mb-4">

                        <h4 class="mb-3">Payment</h4>

                        <div class="d-block my-3">
                            <div class="custom-control custom-radio">
                                <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked="" required="">
                                <label class="custom-control-label" for="credit">Credit card</label>
                            </div>
                            <div class="custom-control custom-radio">
                                <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required="">
                                <label class="custom-control-label" for="debit">Debit card</label>
                            </div>
                            <div class="custom-control custom-radio">
                                <input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" required="">
                                <label class="custom-control-label" for="paypal">PayPal</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="cc-name">Name on card</label>
                                <input type="text" class="form-control" id="cc-name" placeholder="Name on Card" required="true" name="creditCardName">
                                <small class="text-muted">Full name as displayed on card</small>
                                <div class="invalid-feedback">
                                    Name on card is required
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="cc-number">Credit card number</label>
                                <input type="text" class="form-control" id="cc-number" placeholder="XXXX XXXX XXXX XXXX" required="true" name="creditCardNumber">
                                <div class="invalid-feedback">
                                    Credit card number is required
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3 mb-3">
                                <label for="cc-expiration">Expiration</label>
                                <input type="text" class="form-control" id="cc-expiration" placeholder="MM/YYYY" required="true" name="creditCardExpiration">
                                <div class="invalid-feedback">
                                    Expiration date required
                                </div>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="cc-cvv">CVV</label>
                                <input type="text" class="form-control" id="cc-cvv" placeholder="999" required="true" name="creditCardCVV">
                                <div class="invalid-feedback">
                                    Security code required
                                </div>
                            </div>
                        </div>
                        <% if (paymentError != null) {%>
                        <div class="alert alert-danger" role="alert">
                            <%= paymentError%>
                        </div>  
                        <% }%>            
                        <hr class="mb-4">
                        <button class="btn btn-primary btn-lg btn-block" type="submit" name="action" value="payment">Make Payment</button>
                    </form>
                </div>

            </div>
        </div>
    </body>
</html>
<jsp:include page="/footer.jsp"/> 

