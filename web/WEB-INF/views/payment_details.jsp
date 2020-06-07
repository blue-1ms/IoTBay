<%-- 
    Document   : confirmation
    Created on : 01/06/2020, 7:54:05 PM
    Author     : mscov
--%>

<%@page import="uts.isd.model.Payment"%>
<jsp:include page="/header.jsp"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">    
<div class="container">
    <div class="row">
        <div class="col m-4">
            
            <form action="payment" method="post">
                <h4 class="mb-3">Payment Details</h4>

                <%
                    //Check for default payment method
                    Payment defaultPayment = (Payment) request.getAttribute("defaultPayment");                    
                    //Check for success message
                    String paymentSuccess = (String) request.getAttribute("paymentSuccess");    
                    //Check for error message
                    String paymentError = (String) request.getAttribute("paymentError");    
                %>

                <input type="hidden" name="paymentID" value="<%= (defaultPayment != null) ? defaultPayment.getPaymentID(): "" %>">
                
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

                <hr class="mb-4">

                <% if (defaultPayment == null) { %>
                <div class="row">
                  <div class="col mb-3">
                    <button class="btn btn-primary btn-lg btn-block" type="submit" name="action" value="add">Add</button>
                  </div>
                </div>                
                <% } 
                   else {
                %>
                <div class="row">
                  <div class="col-md-3 mb-3">
                    <button class="btn btn-primary btn-lg btn-block" type="submit" name="action" value="update">Update</button>
                  </div>
                  <div class="col-md-3 mb-3">
                    <button class="btn btn-danger btn-lg btn-block" type="submit" name="action" value="remove">Remove</button>
                  </div>
                </div>
                <% } %>

                <% if (paymentSuccess != null) { %>
                <div class="alert alert-success" role="alert">
                    <%= paymentSuccess %>
                </div>  
                <% } %>  
                
                <% if (paymentError != null) { %>
                <div class="alert alert-danger" role="alert">
                    <%= paymentError %>
                </div>  
                <% } %>  
                
            </form>
                    
        </div>
    </div>
</div>

<jsp:include page="/footer.jsp"/>