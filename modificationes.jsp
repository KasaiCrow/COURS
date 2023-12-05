<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Connexion à MySQL via JSP</title>
</head>
<body>
    <form action="modificationes.jsp" method="post">
    <input type="text" id="id" name="id" placeholder="ID du FILM" required>
    <input type="text" id="nom" name="nom" placeholder="Insérer un nom svp" required>
    <input type="submit" value="Envoyer">
</form>
<% 
String url = "jdbc:mariadb://localhost:3306/films";
String user = "mysql";
String password = "mysql";

    // Charger le pilote JDBC
    Class.forName("org.mariadb.jdbc.Driver");

    // Établir la connexion
Connection conn = DriverManager.getConnection(url, user, password);
 
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
    // Fermer les ressources 
    rs.close();
    pstmt.close();
    conn.close();
%>
</body>
</html>