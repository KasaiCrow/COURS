<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Connexion à MySQL via JSP</title>
</head>
<body>
    <form action="Select_BDD.jsp" method="post">
    <input type="text" id="annee" name="annee" placeholder="Année d'un film" required>
    <input type="submit" value="Envoyer">
</form>
    <h1>Exemple de connexion à MySQL via JSP</h1>
    <% 
    String url = "jdbc:mariadb://localhost:3306/films";
    String user = "mysql";
    String password = "mysql";

        // Charger le pilote JDBC
        Class.forName("org.mariadb.jdbc.Driver");

        // Établir la connexion
Connection conn = DriverManager.getConnection(url, user, password);
            // Exemple de requête SQL
        request.getParameter("annee");
        String valeurInput = request.getParameter("annee");
        String sql = "SELECT idFilm, titre, année FROM Film WHERE année = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, valeurInput);
        ResultSet rs = pstmt.executeQuery();

        String idFilmStr = request.getParameter("id");
        String nouveauTitre = request.getParameter("nom");
         if (idFilmStr != null && nouveauTitre != null && !idFilmStr.isEmpty() && !nouveauTitre.isEmpty()) {
        try {
            // Convertir l'ID du film en entier
            int idFilm = Integer.parseInt(idFilmStr);

            // Préparer la requête SQL de mise à jour
            String sql = "UPDATE titre SET titre = ? WHERE idFilm = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, titre);
            pstmt.setInt(2, idFilm);

            // Exécuter la mise à jour
            int rowsAffected = pstmt.executeUpdate();

            // Vérifier si la mise à jour a réussi
            if (rowsAffected > 0) {
                out.println("Mise à jour réussie !");
            } else {
                out.println("Aucun film trouvé avec l'ID spécifié.");
            }

            // Fermer les ressources
            pstmt.close();
            conn.close();

        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();
            out.println("Erreur lors de la mise à jour du film.");
        }
    } else {
        out.println("Veuillez fournir l'ID du film et le nouveau titre.");
    }

        // Afficher les résultats (à adapter selon vos besoins)
        while (rs.next()) {
            String colonne1 = rs.getString("idFilm");
            String colonne2 = rs.getString("titre");
            String colonne3 = rs.getString("année");
            // Faites ce que vous voulez avec les données...
            //Exemple d'affichage de 2 colonnes
            out.println("id : " + colonne1 + ", titre : " + colonne2 + ", année : " + colonne3 + "</br>");
        }

        // Fermer les ressources 
        rs.close();
        pstmt.close();
        conn.close();
    %>
</body>
</html>