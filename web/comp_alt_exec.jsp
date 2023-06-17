<%-- 
    Document   : comp_alt_exec
    Created on : 16 de jun. de 2023, 23:53:56
    Author     : Richard e Derick
--%>

<%@page import="controles.ComponentesDAO"%>
<%@page import="controles.HistoricoAlt"%>
<%@page import="controles.DataUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.*" import="java.lang.*" import="java.sql.*" import="java.util.Date" %>
<%@page import="controles.Componentes" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Atualização de Equipamentos</title>
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
                margin: 30px 20px 15px 20px;
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
            Componentes comp = new Componentes(id, data, nomeSwitch, portaSwitch, patchPainel, portaPatchPainel, endMac, nomePC, endIP, estado, observacao);
        %>
            <div class="container">
                <h1 class="styleTitle">Adicionando Equipamento</h1>
                <div class="elemento">
        <%  
                /*-- Saída --*/
                out.println("<br> Cod......: " + comp.getId());
                out.println("<br> Switch......: " + comp.getNomeSwitch());
                out.println("<br> Porta Switch...: " + comp.getPortaSwitch());
                out.println("<br> Patch Painel...: " + comp.getPatchPanel());
                out.println("<br> Porta Patch Painel...: " + comp.getPortaPatchPanel());
                out.println("<br> Endereço MAC...: " + comp.getEndMac());
                out.println("<br> Nome Computador...: " + comp.getNomePC());
                out.println("<br> Endereço IP...: " + comp.getEndIP());
                out.println("<br> Estado....: " + comp.getEstado());
                out.println("<br> Observação...: " + comp.getObservacao()); 
                String s_dt_comp = new SimpleDateFormat("yyy/MM/dd").format(comp.getData());
                out.println("<br> Data.....: " + s_dt_comp); 

                /*-- Gravação --*/                         
                try{
                    Class.forName("com.mysql.cj.jdbc.Driver"); // Driver para MySQL -- Registra a Dll
                    String url = "jdbc:mysql://localhost:3306/switchmanager"; // Determina o servidor e banco(DB)
                    Connection conexao = DriverManager.getConnection(url, "root", "");           

                    Statement stmt = conexao.createStatement(); // Criar uma instrução com base na conexão. 
                    Class.forName("com.mysql.cj.jdbc.Driver"); // Driver para MySQL - Registra a Dll

                    // Consulta para obter os dados do item a ser excluído
                    String selectSql = "SELECT * FROM componentes WHERE id = " + id;
                    ResultSet rs = stmt.executeQuery(selectSql);
                    if (rs.next()) {
                    // Recuperar e armazena os valores do item
                    Date data_alt = rs.getDate("data_hora");
                    String nomeSwitch_alt = rs.getString("switch");
                    int portaSwitch_alt = rs.getInt("porta_switch");
                    String patchPanel_alt = rs.getString("patch_painel");
                    int portaPatchPanel_alt = rs.getInt("porta_patchpainel");
                    String endMac_alt = rs.getString("end_mac");
                    String nomePC_alt = rs.getString("nome_pc");
                    String endIP_alt = rs.getString("end_ip");
                    String estado_alt = rs.getString("estado");
                    String observacao_alt = rs.getString("obs");

                    // Criar o objeto para inserção na tabela historico_alt
                    HistoricoAlt historicoAlt = new HistoricoAlt(0,data_alt, nomeSwitch_alt, portaSwitch_alt, patchPanel_alt, portaPatchPanel_alt, endMac_alt, nomePC_alt, endIP_alt, estado_alt, observacao_alt);

                    // Inserir na tabela historico_alt
                    ComponentesDAO comp_alt = new ComponentesDAO();
                    comp_alt.AltComp(historicoAlt);

                    /*-- "UPDATE produto SET nome='[value-2]', valor='[value-3]', fabricacao='[value-4]' WHERE 1" --*/
                    String sql = "UPDATE componentes SET data_hora='" + s_dt_comp + "', switch='" + comp.getNomeSwitch() + "', porta_switch= " + comp.getPortaSwitch() + 
                    ", patch_painel='" + comp.getPatchPanel() + "', porta_patchpainel= " + comp.getPortaPatchPanel() + ", end_mac='" + comp.getEndMac() + 
                    "', nome_pc='" + comp.getNomePC() + "', end_ip='" + comp.getEndIP() + "', estado='" + comp.getEstado() + "', obs='" + comp.getObservacao() + 
                    "' WHERE id = " + id;            

                    /*-- out.println("<br> <br>SQL: " + sql); --*/
                    stmt.executeUpdate(sql);
                    stmt.close();
                    %>
                    <br>
                    <%
                    out.println("<br> Registro alterado com sucesso!");
                }        
                }catch (Exception ex) {
                    out.println("<br> Erro:" + ex);
                }
        %>
                    <br><br>
                    <button class="btn" onclick="document.location='index.html'"> Inicio</button>
                </div><!-- elemento -->
            </div><!-- container -->
    </body>
</html>
