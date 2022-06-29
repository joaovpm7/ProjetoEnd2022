<%-- 
    Document   : pesquisar
    Created on : 29/06/2022, 09:12:02
    Author     : sala303b
--%>

<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%
    String nome = "";
    session = request.getSession();

    if (session.getAttribute("user") != null) {
        Usuario user = (Usuario) session.getAttribute("user");
        nome = user.getNome();

        if (request.getParameter("logout") != null) {

            session = request.getSession();
            session.invalidate();
            response.sendRedirect("../tela/index.jsp");

        }
    } else {
        response.sendRedirect("../tela/index.jsp");
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <head>
        <title>Ecovix</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <!--Fontawesome CDN-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">

        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../css/bootstrap.css" />
        <link rel="stylesheet" href="../css/estilo.css" />
    </head>
    
    <body>
         <img class="logousuario" src="../img/logousuario.jpg" />


        <div class="btn-group drop col-1">
            <button type="button"
                    class="btn btn-success dropdown-toggle"
                    data-toggle="dropdown"
                    aria-expanded="false"
                    style="text-align: center">
                <%=nome%>
            </button>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="#">Editar Perfil</a>
                <a class="dropdown-item" href="#">Listar meus Pontos de coleta</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="indexuser.jsp?logout=true">Sair</a>
            </div>
        </div>

        <table class="tabela" width="100%">
            <tr>
                <td><div class="espaco7"></div></td>
                <td>
                    <div class="imglogo divlogo">
                        <img src="../img/LogoVIX.png"/>
                    </div>
                </td>

                <td colspan="1">
                    <table cellpadding="35" class="tabela2" width="5%">
                        <td width="4px"><a class="btn btn-success" href="../telauser/indexuser.jsp" role="button"><b>Home</b></a></td>
                        <td width="4px"><a class="btn btn-success" href="../telauser/sobreuser.jsp" role="button"><b>Sobre</b></a></td>
                        <td width="4px"><a class="btn btn-success" href="../telauser/contatouser.jsp" role="button"><b>Contato</b></a></td>
                        <td width="4px"><a class="btn btn-success disabled" href="login.jsp" type="button"><b>Login</b></a></td>
                    </table>
                </td>
                <td><div class="espaco"></div></td>
            </tr>
        </table>
    </body>
</html>
