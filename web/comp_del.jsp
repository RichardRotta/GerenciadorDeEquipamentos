<%-- 
    Document   : prod_cad.jsp
    Created on : 16/05/2023, 21:03:31
    Author     : alunos
--%>

<%@page import="controles.ComponentesDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.*" import="java.lang.*" import="java.sql.*" import="java.util.Date"%>
<%@page import="controles.Componentes" import="controles.HistoricoDel"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Apagar Produtos</title>
    </head>
    <body>
    <h1>Produtos [Apagar]</h1>
    <%         
        /*-- Entrada --*/
        String id = request.getParameter("id"); // Recebendo do .html

        /*-- Execução DB --*/
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Driver para MySQL - Registra a Dll
            String url = "jdbc:mysql://localhost:3306/switchmanager"; // Determina o servidor e banco(DB)
            Connection conexao = DriverManager.getConnection(url, "root", "");

            Statement stmt = conexao.createStatement(); // Criar uma instrução com base na conexão.
            
            // Consulta para obter os dados do item a ser excluído
            String selectSql = "SELECT * FROM componentes WHERE id = " + id;
            ResultSet rs = stmt.executeQuery(selectSql);
            
            if (rs.next()) {
                // Recuperar e armazena os valores do item
                Date data_del = rs.getDate("data_hora");
                String nomeSwitch_del = rs.getString("switch");
                int portaSwitch_del = rs.getInt("porta_switch");
                String patchPanel_del = rs.getString("patch_painel");
                int portaPatchPanel_del = rs.getInt("porta_patchpainel");
                String endMac_del = rs.getString("end_mac");
                String nomePC_del = rs.getString("nome_pc");
                String endIP_del = rs.getString("end_ip");
                String estado_del = rs.getString("estado");
                String observacao_del = rs.getString("obs");
                
                // Criar o objeto para inserção na tabela historico_del
                HistoricoDel historicoDel = new HistoricoDel(0,data_del, nomeSwitch_del, portaSwitch_del, patchPanel_del, portaPatchPanel_del, endMac_del, nomePC_del, endIP_del, estado_del, observacao_del);
                
                // Inserir na tabela historico_del
                ComponentesDAO comp_del = new ComponentesDAO();
                comp_del.DelComp(historicoDel);
                
                // Executar a exclusão na tabela produto
                String deleteSql = "DELETE FROM componentes WHERE id = " + id;
                int i = stmt.executeUpdate(deleteSql);

                if (i > 0) {
                    out.println("<br> Registro excluído com sucesso!");
                } else {
                    out.println("<br> Erro na instrução!");
                }
            } else {
                out.println("<br> Item não encontrado!");
            }
            
            stmt.close();
        } catch (Exception ex) {
            out.println("<br> Erro: " + ex);
        }
    %>


        <br><br>
        <button onclick="document.location='index.html'"> Início</button>
    </body>
</html>
