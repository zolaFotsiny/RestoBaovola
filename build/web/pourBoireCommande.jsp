<%-- 
    Document   : pourBoireCommande
    Created on : 28 mars 2022, 16:13:10
    Author     : Mahandry
--%>

<%@page import="Modele.Commande"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    List <Commande> c=(List<Commande>)request.getAttribute("commande");

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1></h1>
        <p>Commande :<br>
        <form action="boireCommande" method="post">
                <select name="commande">
                    <%for(int i=0;i<c.size();i++){ %>
                    <option value="<%= c.get(i).getIdCommande()%>"><%= c.get(i).getDateCommande()%></option>
                    <%}%>
                </select>
                 <input type="submit"  class="bouton2" style="border-style:none" rows="5" value="Trouver">
        </p>
        </form>
    </body>
</html>
