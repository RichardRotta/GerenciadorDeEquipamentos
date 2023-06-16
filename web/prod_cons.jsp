<%-- 
    Document   : prod_cons
    Created on : 23/05/2023, 21:12:15
    Author     : alunos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.*" import="java.lang.*" import="java.sql.*" import="java.util.Date"%>
<%@page import="controles.Produto" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Consulta de Produtos</title>
    </head>
      <body>
        <h1>Produtos [Consulta-Contém]</h1>
        <%
            /*-- Entrada --*/
            String nome = request.getParameter("nome_prod");           

            /*-- Consulta --*/                         
            try{
                Class.forName("com.mysql.cj.jdbc.Driver"); // Driver para MySQL -- Registra a Dll
                String url = "jdbc:mysql://localhost:3306/fabrica"; // Determina o servidor e banco(DB)
                Connection conexao = DriverManager.getConnection(url, "root", "");           

                Statement stmt = conexao.createStatement(); // Criar uma instrução com base na conexão. 
                
                /*-- "SELECT * FROM produto WHERE nome LIKE '%de%'" --*/
                String sql = "SELECT * FROM produto WHERE nome LIKE '%" + nome + "%'";       
                
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) {
                    out.println("<br><br> Registro(s): " + rs.getRow());
                    out.println("<br> Id: " + rs.getString("pk_id"));
                    out.println("<br> Nome: " + rs.getString("nome"));
                    out.println("<br> Valor: " + rs.getString("valor"));
                    out.println("<br> Data de fabricação: " + rs.getString("fabricacao"));
                }                          
                stmt.close();                
                
            } catch (Exception ex) {
                out.println("<br> Erro:" + ex);
            }
        %>    
        <br><br>
        <button onclick="document.location='index.html'"> Início</button>
      </body>
</html>
