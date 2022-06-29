<%-- 
    Document   : listar
    Created on : 22/04/2022, 19:58:02
    Author     : carro
--%>


<%@page import="modelo.Usuario"%>
<%@page import="modelo.Cliente"%>
<%@page import="java.util.List"%>


<%
    String nome = "";
    session = request.getSession();

    if (session.getAttribute("user") != null) {
        Usuario user = (Usuario) session.getAttribute("user");
        nome = "Administrador " + user.getNome();

        if (request.getParameter("logout") != null) {

            session = request.getSession();
            session.invalidate();
            response.sendRedirect("../tela/index.jsp");

        }
    } else {
        response.sendRedirect("../tela/index.jsp");
    }


%>

<%    Usuario us = new Usuario();
    List<Usuario> usuarios = us.ListarTodos();
    int tamanholist = usuarios.size();


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="../css/bootstrap.css" />
        <link rel="stylesheet" href="../css/estilo.css" />
        <link rel="stylesheet" href="../css/estilocadastrar.css" />


        <!--Fontawesome CDN-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">

        <title>Ecovix</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <style>
            body{

                color: black;
            }
            
            .btn-danger {
                color: #fff;
                background-color: #dc3545;
                border-color: #dc3545;
            }
        </style>
    </head>
    <body>

       


       <div class="btn-group drop col-1">
            <button type="button"
                    class="btn btn-success dropdown-toggle"
                    data-toggle="dropdown"
                    aria-expanded="false"
                    style="text-align: center">
                <%=nome%>
            </button>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="../telaadmin/listaruseradmin.jsp">Listar Usuarios</a>
                <a class="dropdown-item" href="../telaadmin/listarponto.jsp">Listar Pontos De Coletas</a>
                <a class="dropdown-item" href="../telaadmin/listaritens.jsp">Lista do Item</a>
                <a class="dropdown-item" href="../telaadmin/listarcontato.jsp">Lista do Contato</a>
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
                    <img class="logoffsuario"src="../img/logousuario.jpg" style="width: 75.99px;
                         height: 75.99px;" title=" Deslogado"/>
                </td>
                <td><div class="espaco"></div></td>
            </tr>
        </table>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>

        <div class="align-content-center" class="container">
            <div class="row">
                <div class="col-md-2">                </div>
                <div class="col-md-8">


                    <table class="table-sm table-striped table-success">

                        <h1>Usuarios</h1>
                        <br>
                        <br>
                        <tr>
                            <th>ID</th>
                            <th>ADMIN</th>
                            <th>TPREQUERENTE</th>
                            <th>NOME</th>
                            <th>DDD</th>
                            <th>TELEFONE</th>
                            <th>EMAIL</th>
                            <th>DOCUMENTO</th>
                            <th>DATA NASCIMENTO</th>
                            <th>LOGIN</th>
                            <th>SENHA</th>
                            <th>STATUS</th>
                            <th>AÇÕES</th>
                        </tr>
                        <%
                            for (int i = 0; i < tamanholist; i++) {
//                            for (Cliente pr : clientes) {

                                out.print("<tr>");

                                out.print("<td>");
                                out.print(usuarios.get(i).getId());
                                out.print("</td>");

                                out.print("<td>");
                                out.print(usuarios.get(i).getAdmin());
                                out.print("</td>");

                                out.print("<td>");
                                out.print(usuarios.get(i).getTprequerente());
                                out.print("</td>");

                                out.print("<td>");
                                out.print(usuarios.get(i).getNome());
                                out.print("</td>");

                                out.print("<td>");
                                out.print(usuarios.get(i).getDdd());
                                out.print("</td>");

                                out.print("<td>");
                                out.print(usuarios.get(i).getTelefone());
                                out.print("</td>");

                                out.print("<td>");
                                out.print(usuarios.get(i).getEmail());
                                out.print("</td>");

                                out.print("<td>");
                                out.print(usuarios.get(i).getDocumento());
                                out.print("</td>");

                                out.print("<td>");
                                out.print(usuarios.get(i).getDtnascimento());
                                out.print("</td>");

                                out.print("<td>");
                                out.print(usuarios.get(i).getLogin());
                                out.print("</td>");

                                out.print("<td>");
                                out.print(usuarios.get(i).getSenha());
                                out.print("</td>");

                                out.print("<td>");
                                out.print(usuarios.get(i).getStatus());
                                out.print("</td>");

                                out.print("<td>");

                                out.print("<div style='display:inline-block'>");
                                out.print("<form action='cadastraruser.jsp' method='POST'>");
                                out.print("<input name='acao' type='hidden' value='editar' />");
                                out.print("<input name='idusuario' type='hidden' value='" + usuarios.get(i).getId() + "' />");
                                out.print("<button class='btn btn-info'type='submit'>Editar</button>");
                                out.print("</form>");
                                out.print("</div>");

                                out.print("&nbsp;");
                                out.print("&nbsp;");

                                out.print("<div style='display:inline-block'>");
                                out.print("<form action='../UsuarioServletAdmin' method='POST'>");
                                out.print("<input name='acao' type='hidden' value='desativar' />");
                                out.print("<input name='idusuario' type='hidden' value='" + usuarios.get(i).getId() + "' />");
                                out.print("<button class='btn btn-danger' type='submit'>Desativar</button>");
                                out.print("</form>");
                                out.print("</div>");

                                out.print("<div style='display:inline-block'>");
                                out.print("<form action='../UsuarioServletAdmin' method='POST'>");
                                out.print("<input name='acao' type='hidden' value='ativar' />");
                                out.print("<input name='idusuario' type='hidden' value='" + usuarios.get(i).getId() + "' />");
                                out.print("<button class='btn btn-success type='submit'>Ativar</button>");
                                out.print("</form>");
                                out.print("</div>");

                                out.print("</td>");

                                out.print("</tr>");
                            }

                        %>

                    </table>

                </div>
                <div class="col-md-2">                </div>
            </div>
        </div>


        <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.11.2/jquery.mask.js"></script>


    </body>
</html>
