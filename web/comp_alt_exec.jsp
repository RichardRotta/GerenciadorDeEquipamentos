<%-- 
    Document   : comp_alt_exec
    Created on : 16 de jun. de 2023, 23:53:56
    Author     : Richard e Derick
--%>

<%@page import="controles.DataUtils"%>
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
            request.setCharacterEncoding("UTF-8");
            /*-- Entrada --*/
            int id = Integer.parseInt(request.getParameter("id"));
            String nomeSwitch = request.getParameter("nome_switch");
            int portaSwitch = Integer.parseInt(request.getParameter("porta_switch"));
            String patchPainel = request.getParameter("patch_painel");
            int portaPatchPainel = Integer.parseInt(request.getParameter("porta_patch"));
            String endMac = request.getParameter("end_mac");
            String nomePC = request.getParameter("nome_pc");
            String endIP = request.getParameter("end_ip");
            String estado = request.getParameter("estado");
            String observacao = request.getParameter("obs");
            Date data = DataUtils.converterStringParaData(request.getParameter("dt"));

            /*-- Process --*/
            Componentes comp = new Componentes(0, data, nomeSwitch, portaSwitch, patchPainel, portaPatchPainel, endMac, nomePC, endIP, estado, observacao);

            /*-- Saída --*/
            out.println("<b>Alteração [Produto]:</b>");
            out.println("<br> Cod......: " + comp.getId());
            out.println("<br> Switch......: " + comp.getNomeSwitch());
            out.println("<br> Porta Switch: " + comp.getPortaSwitch());
            out.println("<br> Patch Painel: " + comp.getPatchPanel());
            out.println("<br> Porta Patch Painel: " + comp.getPortaPatchPanel());
            out.println("<br> Endereço MAC: " + comp.getEndMac());
            out.println("<br> Nome Computador: " + comp.getNomePC());
            out.println("<br> Endereço IP: " + comp.getEndIP());
            out.println("<br> Estado....: " + comp.getEstado());
            out.println("<br> Observação: " + comp.getObservacao()); 
            String s_dt_comp = new SimpleDateFormat("yyy/MM/dd").format(comp.getData());
            out.println("<br> Data (str) de Fabricação: " + s_dt_comp); 

            /*-- Gravação --*/                         
            try{
                Class.forName("com.mysql.cj.jdbc.Driver"); // Driver para MySQL -- Registra a Dll
                String url = "jdbc:mysql://localhost:3306/switchmanager"; // Determina o servidor e banco(DB)
                Connection conexao = DriverManager.getConnection(url, "root", "");           

                Statement stmt = conexao.createStatement(); // Criar uma instrução com base na conexão. 
                
                /*-- "UPDATE produto SET nome='[value-2]', valor='[value-3]', fabricacao='[value-4]' WHERE 1" --*/
                String sql = "UPDATE componetes SET data_hora='" + s_dt_comp + "', switch='" + comp.getNomeSwitch() + "', porta_switch= " + comp.getPortaSwitch() + 
                ", patch_painel'" + comp.getPatchPanel() + "', porta_patchpainel= " + comp.getPortaPatchPanel() + ", end_mac='" + comp.getEndMac() + 
                "', nome_pc='" + comp.getNomePC() + "', end_ip='" + comp.getEndIP() + "', estado='" + comp.getEstado() + "', obs='" + comp.getObservacao() + 
                "' WHERE id = " + id;            
                
                /*-- out.println("<br> <br>SQL: " + sql); --*/
                stmt.executeUpdate(sql);
                stmt.close();
                
                out.println("<br> Registro alterado com sucesso!");
            } catch (Exception ex) {
                out.println("<br> Erro:" + ex);
            }
        %>
    </body>
</html>
