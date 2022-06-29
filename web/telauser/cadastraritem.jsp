<%-- 
    Document   : cadastraritem
    Created on : 15/06/2022, 10:38:18
    Author     : sala303b
--%>
<%@page import="modelo.Ponto_item"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Itens"%>
<%

    String nome = "";
    session = request.getSession();
    Usuario user = (Usuario) session.getAttribute("user");
    nome = "Bem-Vindo(a)," + user.getNome();

    String ponto = "";
    session = request.getSession();
    Cliente cli = (Cliente) session.getAttribute("cli");
    ponto = "ID do ponto cadastrado: " + cli.getId();

    Itens i = new Itens();
    List<Itens> itens = i.ListarTodos();

    String acao = "cadastrar", idponto = "", iditem = "";

    Ponto_item pti = new Ponto_item();

    if (request.getParameter("acao") != null) {
        if (request.getParameter("acao").equals("editar")) {

            idponto = request.getParameter("idponto");

            boolean achou = pti.BuscarPorId(idponto);

            if (!achou) {
                out.print("<script>"
                        + "window.alert('Item não Encontrado');"
                        + "</script>");
            }
        } else {
            acao = "editar";
            iditem = String.valueOf(pti.getIditem().getId());
        }
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" type="text/css" href="../css/estilocadastrar.css">
        <link rel="stylesheet" href="../css/estilo.css" />
        <link rel="stylesheet" href="../css/estiloitems.css" />
        <link rel="stylesheet" href="../css/bootstrap.css" />
        <link rel="stylesheet" href="../css/estilocontato.css"/>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar item</title>
        <style>
            .col {
                -ms-flex-preferred-size: 0;
                flex-basis: 0;
                -ms-flex-positive: 1;
                flex-grow: 1;
                max-width: 11%;
            }
            .row {
                display: -ms-flexbox;
                display: flex;
                -ms-flex-wrap: wrap;
                flex-wrap: wrap;
                margin-right: -580px;
                margin-left: 580px;
            }
        </style>
    </head>
    <body>
        <table class="tabela" width="100%">
            <tr>
                <td><div class="espaco"></div></td>
                <td>
                    <div class="imglogo">
                        <img src="../img/LogoVIX.png"/>
                    </div>
                </td>
                <td colspan="1">
                    <table cellpadding="15" class="tabela2" width="5%">
                        <td width="4px"><a class="btn btn-success" href="index.jsp" role="button"><b>Home</b></a></td>
                        <td width="4px"><a class="btn btn-success" href="sobre.jsp" role="button"><b>Sobre</b></a></td>
                        <td width="4px"><a class="btn btn-success" href="contato.jsp" role="button"><b>Contato</b></a></td>
                        <td width="4px"><a class="btn btn-success" href="#" role="button"><b><%=nome%></b></a></td>
                        <td width="4px"><a class="btn btn-success" href="#" role="button"><b><%=ponto%></b></a></td>

                    </table>
                </td>
                <td><div class="espaco10"></div></td>
            </tr>
        </table>
        <br>
        <br>
        <br>
        <h2>
            Selecione um item de coleta abaixo:
        </h2>
        <br>
        <br>
        <br>

        <%
            out.print("<form action='../ItemServlet' method='POST'>");
            out.print("<input required type='hidden' name='acao' value='" + acao + "'/>");
            out.print("<input required type='hidden' name='idponto' value='" + cli.getId() + "'/>");
            //out.print("<input required type='hidden' name='iditem' value='"+i.getId()+"'/>");
            out.print("<div class='espa1'></div>");

            int x = 0;
            for (Itens it : itens) {

                x++;

                if (x == 1) {
                    out.print("<div class='row'>");
                }

                out.print("<label for='item_" + it.getId() + "'>");
                out.print("<div class='col'>");
                out.print("<div class='card text-center' style='width: 10rem;'>");
                out.print("<img src='../img/" + it.getImagem() + "' class='card-img-top' alt='" + it.getTitulo() + "' for='defaultCheck1'>");
                out.print("<div class='card-body'>");
                out.print(it.getTitulo());
                out.print("<br>");
                out.print("<br>");
                out.print("<div class='form-check'>");
                out.print("<input class='form-check-input' type='checkbox' id='item_" + it.getId() + "' value='" + it.getId() + "' id='defaultCheck1' name='iditens'/>");
                out.print("</div>");
                out.print("</div>");
                out.print("</div>");
                out.print("</div>");
                out.print("</label>");

                if (x == 3) {
                    out.print("</div>");
                    out.print("<br/><br/>");
                    x = 0;
                }

            }

            out.print("<div class='btnitem'>");
            out.print("<button type='submit'"
                    + " class='btn btn-success btn-lg' "
                    + "style='margin-bottom: 0px;' "
                    + "value='" + acao + "'>Cadastrar");
            out.print("</div>");
            out.print("</div>");

            out.print("</form>");
        %>

        <br>
        <br>
    </body>
</html>
