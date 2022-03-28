<%-- 
    Document   : insertProduit
    Created on : 28 mars 2022, 09:55:45
    Author     : Mahandry
--%>
<%@page import="Modele.Categorie"%>
<%@page import="java.util.List"%>
<%
    List <Categorie> categories=(List<Categorie>)request.getAttribute("categories");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Insertion Produit</h1>
        <form method="post" action="AjouterProduit" >  
            <p>Photo: <input type="file" name="photo"></p>
            <p>Nom: <input type="text" name="nom"></p>
            <p>Categorie :<br>
                <select name="idCat">
                    <%for(int i=0;i<categories.size();i++){ %>
                    <option value="<%= categories.get(i).getIdCategorie()%>"><%= categories.get(i).getNom()%></option>
                    <%}%>
                </select>
                 <input type="submit"  class="bouton2" style="border-style:none" rows="5" value="Trouver">
             </p>
            <p>Last Prix: <input type="text" name="lastPrix"></p>
            <input type="submit" name="Submit" rows="2" value="Ajouter">
        </form>
    </body>
</html>
