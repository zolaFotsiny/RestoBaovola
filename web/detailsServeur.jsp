<%-- 
    Document   : detailsServeur
    Created on : 28 mars 2022, 14:39:28
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Find Serveur</h1>
        
        <form action="findPourBoire" method="POST">
            <input type="date" name="date1" />
            <input type="date" name="date2" />
            <input type="submit" value="find" />
        </form>
    </body>
</html>
