<%-- 
    Document   : details
    Created on : 24 mars 2022, 14:38:28
    Author     : Mahandry
--%>

<%@page import="Modele.ViewPrixRevient"%>
<%@page import="Modele.DetailsProduits"%>
<%@page import="java.util.List"%>
<%@page import="Modele.Ingredient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Ingredient ing = new Ingredient();
    List <DetailsProduits> detailsProduits=(List<DetailsProduits>)request.getAttribute("detailsProduits");
    List <ViewPrixRevient> p = (List<ViewPrixRevient>)request.getAttribute("prixRevient");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
        <style>
        .styled-table {
        border-collapse: collapse;
        margin: 25px 0;
        font-size: 0.9em;
        font-family: sans-serif;
        min-width: 400px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
        }
        .styled-table thead tr {
        background-color: #009879;
        color: #ffffff;
        text-align: left;
        }
        .styled-table th,
        .styled-table td {
        padding: 12px 15px;
        }
        .styled-table tbody tr {
        border-bottom: 1px solid #dddddd;
        }

        .styled-table tbody tr:nth-of-type(even) {
        background-color: #f3f3f3;
        }

        .styled-table tbody tr:last-of-type {
        border-bottom: 2px solid #009879;
        }
        .styled-table tbody tr.active-row {
        font-weight: bold;
        color: #009879;
        }
    </style>
    <body>
        <h1>Details Produit</h1>
        <table class="styled-table">
            <thead>
                <tr>
                      <th> Nom ingredient </th>
                      <th> Quantite </th>
                      
                </tr>
            </thead>
            <tbody>
                 <%for(int i=0;i<detailsProduits.size();i++){ %>
                <tr> 
                    <td><%= ing.nomIngredient(detailsProduits.get(i).getIdIngredient())%></td>
                    <td><%= detailsProduits.get(i).getQuantite()%> g</td>
                </tr>
                
                 <% } %>
            </tbody>
         </table>
                 <h2>Prix de revient: <%= p.get(0).getPrixRevient()%> Ar</h2>
    </body>
</html>
