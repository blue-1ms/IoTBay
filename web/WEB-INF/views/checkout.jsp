<%-- 
    Document   : checkout
    Created on : 26/05/2020, 6:03:33 PM
    Author     : mscov
--%>

<%@page import="uts.isd.model.Payment"%>
<%@page import="uts.isd.model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="mypack.UserBean" scope="session"/>
<jsp:useBean id="cart" class="uts.isd.model.Cart" scope="session"/>
<jsp:setProperty name="cart" property="*"/>

<% 
    //Check for error message
    String paymentError = (String) request.getAttribute("PaymentError");    
    //Check for shipping
    String shippingError = (String) request.getAttribute("ShippingError");
%>

<jsp:include page="/header.jsp"/> 

<div class="container mt-4 mb-4">
    <div class="row">
        
        <div class="col-md-4 order-md-2 mb-4">
          <h4 class="d-flex justify-content-between align-items-center mb-3">
            <span class="text-muted">Your cart</span>
            <!-- Update the pill badge with the number of items in cart -->
            <span class="badge badge-secondary badge-pill"><%=cart.numOfItems() %></span>
          </h4>
          <ul class="list-group mb-3">

            <!-- Loop through each item in the cart -->
            <% for (CartItem cartItem : cart.getItems()) { %>
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0"><%= cartItem.getProductID() %></h6>
                <small class="text-muted">Brief description</small>
              </div>
              <span class="text-muted">$<%= cartItem.getPrice() %> </span>
            </li>
            <% } %>

            <li class="list-group-item d-flex justify-content-between">
              <span>Total</span>
              <strong>$<%= cart.getCartTotal() %></strong>
            </li>
          </ul>
        </div>
       
          
        <div class="col-md-8 order-md-1">
            <form class="needs-validation" novalidate method="post" action="checkout">
                
                <h4 class="mb-3">Shipping address</h4>

                <%
                    //Check for default shipping details
                    Shipping defaultShipping = (Shipping) request.getAttribute("defaultShipping");
                %>
                
                <% if (defaultShipping != null) { %>
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" id="useDefaultShipping" name="useDefaultShipping" checked="">
                      <label class="custom-control-label" for="useDefaultShipping">Use default shipping details</label>
                    </div>
                <% } %>
                
                <div class="row">
                  <div class="col-md-6 mb-3">
                    <label for="firstName">First name</label>
                    <input type="text" class="form-control" id="firstName" placeholder="" required="" name="firstName" value="<%= (user.getFirstName() != null) ? user.getFirstName(): "" %>">
                    <div class="invalid-feedback">
                      Valid first name is required.
                    </div>
                  </div>
                  <div class="col-md-6 mb-3">
                    <label for="lastName">Last name</label>
                    <input type="text" class="form-control" id="lastName" placeholder="" required="" name="lastName" value="<%= (user.getFirstName() != null) ? user.getLastName(): "" %>">
                    <div class="invalid-feedback">
                      Valid last name is required.
                    </div>
                  </div>
                </div>
                
                <div class="mb-3">
                  <label for="email">Email</label>
                  <input type="email" class="form-control" id="email" placeholder="you@example.com" required="" name="email" value="<%= (user.getEmail() != null) ? user.getEmail(): "" %>">
                  <div class="invalid-feedback">
                    Please enter a valid email address for shipping updates.
                  </div>
                </div>                
                
                <div class="mb-3">
                  <label for="address1">Address 1</label>
                  <input type="text" class="form-control" id="address1" placeholder="1234 Main St" required="" name="address1" value="<%= (defaultShipping != null) ? defaultShipping.getAddressLine1() : "" %>">
                  <div class="invalid-feedback">
                    Please enter your shipping address.
                  </div>
                </div>
 
                <div class="mb-3">
                  <label for="address2">Address 2 <span class="text-muted">(Optional)</span></label>
                  <input type="text" class="form-control" id="address2" placeholder="Apartment or suite" name="address2" value="<%= (defaultShipping != null && defaultShipping.getAddressLine2() != null) ? defaultShipping.getAddressLine2() : "" %>">
                </div>

                <div class="row">
                  <div class="col-md-5 mb-3">
                    <label for="country">Country</label>
                    <select class="custom-select d-block w-100" id="country" required="" name="country">
                      <option value="">Choose...</option>
                      <option value="Australia" <%= (defaultShipping != null && defaultShipping.getCountry().equals("Australia")) ? "selected" : "" %> >Australia</option>
                    </select>
                    <div class="invalid-feedback">
                      Please select a valid country.
                    </div>
                  </div>
                  <div class="col-md-4 mb-3">
                    <label for="state">State</label>
                    <select class="custom-select d-block w-100" id="state" required="" name="state">
                      <option value="">Choose...</option>
                      <option value="NSW" <%= (defaultShipping != null && defaultShipping.getState().equals("NSW")) ? "selected" : "" %> >NSW</option>
                      <option value="ACT" <%= (defaultShipping != null && defaultShipping.getState().equals("ACT")) ? "selected" : "" %> >ACT</option>
                      <option value="VIC" <%= (defaultShipping != null && defaultShipping.getState().equals("VIC")) ? "selected" : "" %> >VIC</option>
                      <option value="QLD" <%= (defaultShipping != null && defaultShipping.getState().equals("QLD")) ? "selected" : "" %> >QLD</option>
                      <option value="TAS" <%= (defaultShipping != null && defaultShipping.getState().equals("TAS")) ? "selected" : "" %> >TAS</option>
                      <option value="SA" <%= (defaultShipping != null && defaultShipping.getState().equals("SA")) ? "selected" : "" %> >SA</option>
                      <option value="WA" <%= (defaultShipping != null && defaultShipping.getState().equals("WA")) ? "selected" : "" %> >WA</option>
                      <option value="NT" <%= (defaultShipping != null && defaultShipping.getState().equals("NT")) ? "selected" : "" %> >NT</option>
                    </select>
                    <div class="invalid-feedback">
                      Please provide a valid state.
                    </div>
                  </div>
                  <div class="col-md-3 mb-3">
                    <label for="postCode">Post Code</label>
                    <input type="text" class="form-control" id="postCode" placeholder="" required="" name="postCode" value="<%= (defaultShipping != null) ? defaultShipping.getPostCode(): "" %>">
                    <div class="invalid-feedback">
                      Post code required.
                    </div>
                  </div>
                </div>
                <!--
                <hr class="mb-4">
                <div class="custom-control custom-checkbox">
                  <input type="checkbox" class="custom-control-input" id="same-address">
                  <label class="custom-control-label" for="same-address">Shipping address is the same as my billing address</label>
                </div>
                -->
                
                <% if (shippingError != null) { %>
                <div class="alert alert-danger" role="alert">
                    <%= shippingError %>
                </div>  
                <% } %>            
                
                <hr class="mb-4">

                <h4 class="mb-3">Payment</h4>

                <%
                    //Check for default payment method
                    Payment defaultPayment = (Payment) request.getAttribute("defaultPayment");
                %>

                <% if (defaultPayment != null) { %>
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" id="useDefaultPayment" name="useDefaultPayment" checked="">
                      <label class="custom-control-label" for="useDefaultPayment">Use default payment method</label>
                    </div>
                <% } %>

                <div class="d-block my-3">
                  <div class="custom-control custom-radio">
                    <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" <%= (defaultPayment != null && defaultPayment.getPaymentType() == 1) ? "" : "checked" %> required="">
                    <label class="custom-control-label" for="credit">Credit card</label>
                  </div>
                  <div class="custom-control custom-radio">
                    <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" <%= (defaultPayment != null && defaultPayment.getPaymentType() == 1) ? "checked" : "" %> required="">
                    <label class="custom-control-label" for="debit">Debit card</label>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6 mb-3">
                    <label for="cc-name">Name on card</label>
                    <input type="text" class="form-control" id="cc-name" placeholder="Name on Card" required="true" name="creditCardName" value="<%= (defaultPayment != null) ? defaultPayment.getCardName() : "" %>">
                    <small class="text-muted">Full name as displayed on card</small>
                    <div class="invalid-feedback">
                      Name on card is required
                    </div>
                  </div>
                  <div class="col-md-6 mb-3">
                    <label for="cc-number">Credit card number</label>
                    <input type="text" class="form-control" id="cc-number" placeholder="XXXX XXXX XXXX XXXX" required="true" name="creditCardNumber" value="<%= (defaultPayment != null) ? defaultPayment.getMaskedCardNumber(): "" %>">
                    <div class="invalid-feedback">
                      Credit card number is required
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-3 mb-3">
                    <label for="cc-expiration">Expiration</label>
                    <input type="text" class="form-control" id="cc-expiration" placeholder="MM/YYYY" required="true" name="creditCardExpiration" value="<%= (defaultPayment != null) ? defaultPayment.getCardExpiry(): "" %>">
                    <div class="invalid-feedback">
                      Expiration date required
                    </div>
                  </div>
                  <div class="col-md-3 mb-3">
                    <label for="cc-cvv">CVV</label>
                    <input type="text" class="form-control" id="cc-cvv" placeholder="999" required="true" name="creditCardCVV" value="<%= (defaultPayment != null) ? defaultPayment.getCardCVV(): "" %>">
                    <div class="invalid-feedback">
                      Security code required
                    </div>
                  </div>
                </div>
                <% if (paymentError != null) { %>
                <div class="alert alert-danger" role="alert">
                    <%= paymentError %>
                </div>  
                <% } %>            
                <hr class="mb-4">
                <button class="btn btn-primary btn-lg btn-block mb-4" type="submit" name="action" value="payment">Make Payment</button>
            </form>
        </div>
                 
    </div>
</div>

<jsp:include page="/footer.jsp"/> 

