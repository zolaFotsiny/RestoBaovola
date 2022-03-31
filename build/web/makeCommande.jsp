<%-- 
    Document   : addMalade.jsp
    Created on : 1 mars 2022, 14:42:30
    Author     : zola
--%>
<%@page import="Modele.Tabla"%>
<%@page import="Modele.Produit"%>
<%@page import="Modele.Categorie"%>
<%@page import="java.util.List"%>
<%
    List<Tabla> tablas = (List<Tabla>)request.getAttribute("tablas");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
       
        <div>
            <h1>Generer une commande</h1>
            <form name="form1" method="post" action="generateCommande">
 
             <p>Tables :
                <select name="table">
                    
                    <%for(int i=0;i<tablas.size();i++){ %>
                    <option value="<%= tablas.get(i).getId() %>"><%= tablas.get(i).getNom()%></option>
                    <%}%>
                    
                </select>
                 
             </p>
             <p>
                Date : <input type="date" name="daty">
             </p>
            <input type="submit"  class="bouton2" style="border-style:none" rows="5" value="Generer">
            </form>
                   
        </div> 
    </body>
</html>
