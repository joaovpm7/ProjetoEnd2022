<%-- 
    Document   : listar
    Created on : 22/04/2022, 19:58:02
    Author     : carro
--%>

<%@page import="modelo.Contato"%>
<%@page import="modelo.Ponto_item"%>
<%@page import="modelo.Itens"%>
<%@page import="modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Cliente"%>



<%
    String nomea = "";
    Usuario user = new Usuario();
    session = request.getSession();

    if (session.getAttribute("user") != null) {
        user = (Usuario) session.getAttribute("user");
        nomea = user.getNome();

        if (request.getParameter("logout") != null) {

            session = request.getSession();
            session.invalidate();
            response.sendRedirect("../tela/index.jsp");

        }
    } else {
        response.sendRedirect("../tela/index.jsp");
    }

    Cliente p = new Cliente();
    p.setUser(user);
    List<Cliente> clientes = p.ListarTodosPorUsuario();
    int tamanholista = clientes.size();

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
        </style>
    </head>
    <body>




        <div class="btn-group drop col-1">
            <button type="button"
                    class="btn btn-success dropdown-toggle"
                    data-toggle="dropdown"
                    aria-expanded="false"
                    style="text-align: center">
                <%=nomea%>
            </button>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="../telauser/listaruser.jsp">Meu Perfil</a>
                <a class="dropdown-item" href="../telauser/listarpontouser.jsp">Listar meus Pontos de coleta</a>
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




                    <table class="table table-striped table-success">

                        <h1>Pontos de Coleta</h1>
                        <br>


                        <p 
                            style="color: black;"> Caso queira,<br>Solicite a Alteração e a Exclusão do seu Ponto de Coleta na aba <a style="text-decoration: underline;" href="../telauser/contatouser.jsp" target="_blank">Contato.</a>
                        </p>
                        <br>
                        <br>
                      
           


                        <tr>
                            <th>ID</th>
                            <th>IDUSUARIO</th>
                            <th>UF</th>
                            <th>BAIRRO</th>
                            <th>CIDADE</th>
                            <th>COMPLEMENTO</th>
                            <th>NUMERO</th>
                            <th>CEP</th>
                            <th>LOGRADOURO</th>


                        </tr>


                        <%

                            for (int i = 0; i < tamanholista; i++) {

                                out.print("<tr>");

                                out.print("<td>");
                                out.print(clientes.get(i).getId());
                                out.print("</td>");

                                out.print("<td>");
                                out.print(user.getId());
                                out.print("</td>");

                                out.print("<td>");
                                out.print(clientes.get(i).getUf());
                                out.print("</td>");

                                out.print("<td>");
                                out.print(clientes.get(i).getBairro());
                                out.print("</td>");

                                out.print("<td>");
                                out.print(clientes.get(i).getCidade());
                                out.print("</td>");

                                out.print("<td>");
                                out.print(clientes.get(i).getComplemento());
                                out.print("</td>");

                                out.print("<td>");
                                out.print(clientes.get(i).getNumero());
                                out.print("</td>");

                                out.print("<td>");
                                out.print(clientes.get(i).getCep());
                                out.print("</td>");

                                out.print("<td>");
                                out.print(clientes.get(i).getLogradouro());
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
        <script type="text/javascript" src="../js/jquery.js"></script>
        <script type="text/javascript" src="../js/popper.js"></script>
        <script type="text/javascript" src="../js/bootstrap.js"></script>
        <script type="text/javascript" src="../js/jquery.mask.js"></script>


    </body>
</html>
