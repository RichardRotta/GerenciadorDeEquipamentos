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
        <%
            /*-- Entrada --*/
            String id = request.getParameter("id");
            /*-- Consulta --*/                         
            try{
                Class.forName("com.mysql.cj.jdbc.Driver"); // Driver para MySQL -- Registra a Dll
                String url = "jdbc:mysql://localhost:3306/switchmanager"; // Determina o servidor e banco(DB)
                Connection conexao = DriverManager.getConnection(url, "root", "");           

                Statement stmt = conexao.createStatement(); // Criar uma instrução com base na conexão. 
                
                /*-- "SELECT * FROM produto WHERE nome LIKE '%de%'" --*/
                String sql = "SELECT * FROM componentes WHERE id = " + id;       
                
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) {
        %>
                    <h1>Alteração de equipamentos</h1>                
                    <form name="frmCadProd" method="post" action="comp_alt_exec.jsp">
                        Id: <input type="text" name="id" readonly="true" value="<%= rs.getString("id") %>"> <p>
                        Switch: <input type="text" name="nome_switch" value="<%= rs.getString("switch") %>"> <p>
                        Porta Switch: <input type="text" name="porta_switch" value="<%= rs.getString("porta_switch") %>"> <p>
                        Patch Painel: <input type="text" name="nome_patch" value="<%= rs.getString("patch_painel") %>"> <p>
                        Porta Patch Painel: <input type="text" name="porta_patch" value="<%= rs.getString("porta_patchpainel") %>"> <p>
                        Endereço MAC: <input type="text" name="mac" value="<%= rs.getString("end_mac") %>"> <p>
                        Nome Computador: <input type="text" name="nome_comput" value="<%= rs.getString("nome_pc") %>"> <p>
                        Endereço IP: <input type="text" name="end_ip" value="<%= rs.getString("end_ip") %>"> <p>
                        Estado: <input type="text" name="estado" value="<%= rs.getString("estado") %>"> <p>
                        Observações: <input type="text" name="observacao" value="<%= rs.getString("obs") %>"> <p>
                        <label for="data">Data de Alteração:</label>
                        <input type="date" id="data" name="dt" value="<%= rs.getString("data_hora") %>"> 
                        <br><br>
                        <input type="reset" value="Limpar">
                        <input type="submit" value="Atualizar" name="salvar"> <p>                   
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
