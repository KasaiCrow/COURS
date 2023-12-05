<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Connexion à MySQL via JSP</title>
</head>
<body>
  
    <h1>Exemple de connexion à MySQL via JSP</h1>

    <form action="Select_BDD.jsp" method="post">
        <input type="text" id="annee" name="annee" placeholder="Année d'un film" required>
        <input type="submit" value="Envoyer">
    </form>

    <form action="Select_BDD.jsp" method="post">    
        <input type="text" id="idFilm" name="idFilm" placeholder="id film" required>
        <input type="text" id="nouveauTitre" name="nouveauTitre" placeholder="Nouveau titre du film" required>
        <input type="submit" name="action" value="Modifier">
    </form>

    <% 
        String url = "jdbc:mariadb://localhost:3306/films";
        String user = "mysql";
        String password = "mysql";

        // Charger le pilote JDBC
        Class.forName("org.mariadb.jdbc.Driver");

        // Établir la connexion
        Connection conn = DriverManager.getConnection(url, user, password);

        // Vérifier si le formulaire pour la modification a été soumis
        String action = request.getParameter("action");
        if ("Modifier".equals(action)) {
            // Récupérer les valeurs du formulaire
            int filmId = Integer.parseInt(request.getParameter("idFilm"));
            String nouveauTitre = request.getParameter("nouveauTitre");

            // Exécuter la requête de modification
        String sql2 = "UPDATE Film SET titre = ? WHERE idFilm = ?";
        PreparedStatement pstmt2 = conn.prepareStatement(sql2);
        pstmt2.setString(1, nouveauTitre);
        pstmt2.setInt(2, filmId);
        pstmt2.executeUpdate(); // Utilisez executeUpdate() sans spécifier la requête SQL
        pstmt2.close();

        }

        // Exemple de requête SQL pour la sélection
        String valeurInput = request.getParameter("annee");
        String sql = "SELECT idFilm, titre, année FROM Film WHERE année = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, valeurInput);
        ResultSet rs = pstmt.executeQuery();

        // Afficher les résultats (à adapter selon vos besoins)
        while (rs.next()) {
            String colonne1 = rs.getString("idFilm");
            String colonne2 = rs.getString("titre");
            String colonne3 = rs.getString("année");
            // Faites ce que vous voulez avec les données...
            // Exemple d'affichage de 2 colonnes
            out.println("id : " + colonne1 + ", titre : " + colonne2 + ", année : " + colonne3 + "<br>");
        }

        // Fermer les ressources 
        rs.close();
        pstmt.close();
        conn.close();
    %>
</body>
</html>
