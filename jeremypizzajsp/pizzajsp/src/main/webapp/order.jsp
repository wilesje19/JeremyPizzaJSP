<%-- 
    Document   : order
    Created on : Feb 20, 2017, 10:35:05 AM
    Author     : Jeremy Wiles
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Jeremy's JSP Pizza Order</title>
    </head>
    <body>
        <h1>Order Results</h1>

<!--    We could use <%= request.getParameter("email")%> here but the 
        JSP EL Expression Language has a nicer syntax
        -->
        <p>Email = ${param.email}</p>
        <p>Size = ${param.size}</p>
        <p> Crust =${param.crust}</p>
        
              
        <%
            // Checkboxes from a form may or may not be checked. We can use the
            // following code to get an array of the values that are checked.
            String toppings[] = request.getParameterValues("toppings");
            double price = 0.00;
            DecimalFormat df = new DecimalFormat("0.00"); 
            if (toppings != null && toppings.length != 0) {
                out.println("<p>Toppings: ");
                for (String myTopping : toppings) {
                    out.println(myTopping + ", ");
                }
                out.println("</p>");
                price += toppings.length * 0.75;
            }
            
            switch (request.getParameter("size")) {
                case "large": price += 7.00; break;
                case "medium": price += 6.00; break;
                case "small": price += 5.00; break;
            }
            
            switch (request.getParameter("crust")) {
                case "pan": price += 1.00; break;
                case "hand-tossed": price += 0.50; break;
                case "thin": price += 0.00; break;
            }
            
            out.println("<p>Price = $" + df.format(price) + "</p>");
        %>
    </body>
</html>
