<%-- 
    Document   : comp_cad.jsp
    Created on : 16/06/2023, 21:03:31
    Author     : Richard e Detick
--%>

<%@page contentType="text/html;charset=ISO-8859-1"%>
<%@page import="java.text.*" import="java.lang.*" import="java.sql.*" import="java.util.Date"%>
<%@page import="controles.Componentes" import="controles.ComponentesDAO" import="controles.DataUtils"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">        
        <title>Adicionando Equipamento</title>
    </head>
    <body>
        <h1>Adicionando Equipamento</h1>
        <%
           
             
            
            Date data = DataUtils.converterStringParaData(request.getParameter("dtHora"));
            String nomeSwitch = request.getParameter("nome_switch");
            String converter_Int = request.getParameter("porta_switch");
            int portaSwitch = Integer.parseInt(converter_Int);
           
            String patchPanel = request.getParameter("nome_patch");
         
            String converterInt = request.getParameter("porta_patch");
            int portaPatchPanel = Integer.parseInt(converterInt);
            
            String endMac = request.getParameter("mac");
            String nomePC = request.getParameter("nome_comput");
            String endIP = request.getParameter("ip");
            String estado = request.getParameter("estado");
            String observacao = request.getParameter("observacao");
            
           
            
            /*-- Process --*/
            Componentes comp = new Componentes(0,data, nomeSwitch, portaSwitch, patchPanel, portaPatchPanel, endMac, nomePC, endIP, estado, observacao);
            
            /*-- Saida --*/
            out.println("<b>Registro [Switch]:</b>");
            out.println("<br> Cod......: " + comp.getId());
            out.println("<br> Data:" + comp.getData());
            out.println("<br> Nome......: " + comp.getNomeSwitch());
            out.println("<br> Porta do Switch......: " + comp.getNomeSwitch());
            out.println("<br> Patch Panel......: " + comp.getPatchPanel());
            out.println("<br> Porta do Patch Panel......: " + comp.getPortaPatchPanel());
            out.println("<br> Endereco MAC......: " + comp.getEndMac());
            out.println("<br> Nome do PC......: " + comp.getNomePC());
            out.println("<br> Endereco IP......: " + comp.getEndIP());
            out.println("<br> Estado......: " + comp.getEstado());
            out.println("<br> obs......: " + comp.getObservacao());
            
            

            /*-- Gravação --*/                         
            ComponentesDAO comp_add = new ComponentesDAO();
            try {
                if (comp_add.addComp(comp)) {
                out.println("<br> Registro inserido com sucesso!");}
                }catch (Exception ex) {
                out.println("<br> Ocorreu um erro: " + ex.getMessage());}
            request.setCharacterEncoding("UTF-8"); // Muda o Encoding para UTF-8 na requisiÃ§Ã£o.
        %>   
        <br><br>
        <button onclick="document.location='index.html'"> Inicio</button>
    </body>
</html>

