<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Connexion à MySQL via JSP</title>
</head>
<body>
    <form action="Select_BDD.jsp" method="post">
    <input type="text" id="id" name="id" placeholder="ID du FILM" required>
    <input type="text" id="nom" name="nom" placeholder="Insérer un nom svp" required>
    <input type="submit" value="Envoyer">
</form>
</body>
</html>