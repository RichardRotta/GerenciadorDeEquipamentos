<%-- 
    Document   : comp_alt_edit
    Created on : 16 de jun. de 2023, 23:12:49
    Author     : Richard e Derick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.*" import="java.lang.*" import="java.sql.*" import="java.util.Date" %>
<%@page import="controles.Componentes" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Atualização de Equipamentos</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            /*-- Entrada --*/
            String id = request.getParameter("id");  
            /*-- Consulta --*/                         
            try{
                Class.forName("com.mysql.cj.jdbc.Driver"); // Driver para MySQL -- Registra a Dll
                String url = "jdbc:mysql://localhost:3306/fabrica"; // Determina o servidor e banco(DB)
                Connection conexao = DriverManager.getConnection(url, "root", "");           

                Statement stmt = conexao.createStatement(); // Criar uma instrução com base na conexão. 
                
                /*-- "SELECT * FROM produto WHERE nome LIKE '%de%'" --*/
                String sql = "SELECT * FROM produto WHERE pk_id = " + id;       
                
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) {
        %>
                    <h1>Produtos [Alteração]</h1>                
                    <form name="frmCadProd" method="post" action="prod_alt_exec.jsp">
                        Id: <input type="text" name="id" readonly="true" value="<%= rs.getString("pk_id") %>"> <p>
                        Nome: <input type="text" name="nome_prod" value="<%= rs.getString("nome") %>"> <p>
                        Valor: <input type="text" name="valor" value="<%= rs.getString("valor") %>"> <p>
                        <label for="fabrica">Data de Fabricação:</label>
                        <input type="date" id="fabrica" name="fabrica" value="<%= rs.getString("fabricacao") %>"> 
                        <br><br>
                        <input type="reset" value="Limpar">
                        <input type="submit" value="Salvar" name="salvar"> <p>                   
                    </form>       
        <%
                }                          
                stmt.close();                
                
            } catch (Exception ex) {
                out.println("<br> Erro:" + ex);
            }
        %>
    </body>
</html>
