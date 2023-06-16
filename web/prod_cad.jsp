<%-- 
    Document   : prod_cad.jsp
    Created on : 16/05/2023, 21:03:31
    Author     : alunos
--%>

<%@page contentType="text/html;charset=ISO-8859-1"%>
<%@page import="java.text.*" import="java.lang.*" import="java.sql.*" import="java.util.Date"%>
<%@page import="controles.Produto" import="controles.ConexaoDao" import="controles.DataUtils"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">        
        <title>Cadastro de Produtos</title>
    </head>
    <body>
        <h1>Produtos [Cadastro]</h1>
        <%
            
            /*-- Entrada --*/
            String nome = request.getParameter("nome_prod");
            float valor = Float.parseFloat(request.getParameter("valor"));
            Date fabrica = DataUtils.converterStringParaData(request.getParameter("fabrica"));


            /*-- Process --*/
            Produto prod = new Produto(0, nome, valor, fabrica);

            /*-- Saída --*/
            out.println("<b>Registro [Produto]:</b>");
            out.println("<br> Cod......: " + prod.getCod());
            out.println("<br> Nome......: " + prod.getNome());
            out.println("<br> Valor......: " + prod.getValor());
            out.println("<br> Data de Fabricação: " + prod.getFabrica()); 

            /*-- Gravação --*/                         
            ConexaoDao prod_cad = new ConexaoDao();
            if(prod_cad.cadastrar(prod))
            {
                out.println("<br> Registro inserido com sucesso!");
            }
            else{
                out.println("<br> Erro:");
            }
        %>   
        <br><br>
        <button onclick="document.location='index.html'"> Início</button>
    </body>
</html>

