<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Connexion à MySQL via JSP</title>
</head>
<body>
    <h1>Exemple de connexion à MySQL via JSP</h1>
    <% 
    String url = "jdbc:mariadb://localhost:3306/films";
    String user = "mysql";
    String password = "mysql";

        // Charger le pilote JDBC
        Class.forName("org.mariadb.jdbc.Driver");

        // Établir la connexion
Connection conn = DriverManager.getConnection(url, user, password);

    String sql = "SELECT idFilm, titre FROM Film where année>2000";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();

    while (rs.next()) {
        String colonne1 = rs.getString("idFilm");
        String colonne2 = rs.getString("titre");
        // Faites ce que vous voulez avec les données...
        //Exemple d'affichage de 2 colonnes
        out.println("Colonne 1 : " + colonne1 + ", Colonne 2 : " + colonne2 + "</br>");
    }

    // Fermer les ressources 
    rs.close();
    pstmt.close();
    conn.close();

%>
</body>
</html>
