<%-- 
    Document   : comp_cad.jsp
    Created on : 16/06/2023, 21:03:31
    Author     : Richard e Detick
--%>

<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.text.*" import="java.lang.*" import="java.sql.*" import="java.util.Date"%>
<%@page import="controles.Componentes" import="controles.ComponentesDAO" import="controles.DataUtils"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Adicionando Equipamento</title>
        <style>
            .container{
                background-color: #8C52FF;
                color: white;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                height: 100%;
                margin: 0 auto;
                font-family: "arial";
                font-weight: bold;
                 
            }
            .elemento{
                padding: 10px 80px;
            }
            
            .styleTitle{
                margin: 30px 20px 30px 20px;
                font-size: 30px;
            }
            
            .btn{
                border: none;
                padding: 5px;
                margin-top: 15px;
                margin-left: 80px;
                cursor: pointer;
                margin-top: 0px;
                border-radius: 5px;
                font-size: 16px;
                background-color: white;
                width: 100px;
                
            }
            
            .btn:hover{
                background-color: #BC9AFF;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1 class="styleTitle">Adicionando Equipamento</h1>
            <div class="elemento">
                <%
                request.setCharacterEncoding("UTF-8");
                
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
                    out.println("<br> Data....:" + comp.getData());
                    out.println("<br> Nome......: " + comp.getNomeSwitch());
                    out.println("<br> Porta do Switch......: " + comp.getNomeSwitch());
                    out.println("<br> Patch Panel......: " + comp.getPatchPanel());
                    out.println("<br> Porta do Patch Panel......: " + comp.getPortaPatchPanel());
                    out.println("<br> Endereco MAC......: " + comp.getEndMac());
                    out.println("<br> Nome do PC......: " + comp.getNomePC());
                    out.println("<br> Endereco IP......: " + comp.getEndIP());
                    out.println("<br> Estado......: " + comp.getEstado());
                    out.println("<br> observação......: " + comp.getObservacao());

                    /*-- Gravação ao bd --*/                         
                    ComponentesDAO comp_add = new ComponentesDAO();
                    try {
                        if (comp_add.addComp(comp)) {
                        out.println("<br> Registro inserido com sucesso!");}
                        }catch (Exception ex) {
                        out.println("<br> Ocorreu um erro: " + ex.getMessage());}
                    request.setCharacterEncoding("UTF-8"); // Muda o Encoding para UTF-8 na requisição.
                %>   
                <br><br>
                <button class="btn" onclick="document.location='index.html'"> Inicio</button>
            </div><!-- Elemento -->
        </div><!--Container-->
    </body>
</html>

