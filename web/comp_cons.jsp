<%-- 
    Document   : prod_cons
    Created on : 23/05/2023, 21:12:15
    Author     : alunos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.*" import="java.lang.*" import="java.sql.*" import="java.util.Date"%>
<%@page import="controles.Componentes" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Consulta de Equipamentos</title>
        <style>
            table {
                border-collapse: collapse;
                width: 100%;
            }      
            th, td{
                padding: 4px;
                text-align: left;
                border: 1px solid #8C52FF;
            }
            tr:hover {background-color: #BC9AFF;}
        </style>
    </head>
    
      <body>
        <h1>Consulta dos Equipamentos</h1>
        <%
            /*-- Entrada --*/
            String nome = request.getParameter("nome_switch");
            
            /*-- Consulta --*/                         
            try{
                Class.forName("com.mysql.cj.jdbc.Driver"); // Driver para MySQL -- Registra a Dll
                String url = "jdbc:mysql://localhost:3306/switchmanager"; // Determina o servidor e banco(DB)
                Connection conexao = DriverManager.getConnection(url, "root", "");           

                Statement stmt = conexao.createStatement(); // Criar uma instrução com base na conexão.                
                String sql = "SELECT * FROM componentes WHERE switch LIKE '%" + nome + "%'";       
                
                ResultSet rs = stmt.executeQuery(sql);
        %>        
               
        <table style="width:100%">
            <tr>
               <th>#</th>
               <th>Id</th>
               <th>Data</th>
               <th>Switch</th>
               <th>Porta Switch</th>
               <th>Patch Painel</th>
               <th>Porta Patch Painel</th>
               <th>Endereço MAC</th>
               <th>Nome Computador</th>
               <th>Endereço IP</th>
               <th>Estado</th>
               <th>Observação</th>
            </tr>
                
        <%
                while (rs.next()) {
        %>
            <tr>
               <td><%= rs.getRow() %></td>
               <td><%= rs.getString("id") %></td>
               <td><%= rs.getString("data_hora") %></td>
               <td><%= rs.getString("switch") %></td>
               <td><%= rs.getString("porta_switch") %></td>
               <td><%= rs.getString("patch_painel") %></td>
               <td><%= rs.getString("porta_patchpainel") %></td>
               <td><%= rs.getString("end_mac") %></td>
               <td><%= rs.getString("nome_pc") %></td>
               <td><%= rs.getString("end_ip") %></td>
               <td><%= rs.getString("estado") %></td>
               <td><%= rs.getString("obs") %></td>
            </tr>
        <%
                }    
        %>
        </table>
        <%
                stmt.close();             
            } catch (Exception ex) {
                out.println("<br> Erro:" + ex);
            }
        %>    
        <br><br>
        <button onclick="document.location='index.html'"> Início</button>
      </body>
</html>
