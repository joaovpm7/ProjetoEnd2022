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
    session = request.getSession();

    if (session.getAttribute("user") != null) {
        Usuario user = (Usuario) session.getAttribute("user");
        nomea = "Administrador " + user.getNome();

        if (request.getParameter("logout") != null) {

            session = request.getSession();
            session.invalidate();
            response.sendRedirect("../tela/index.jsp");

        }
    } else {
        response.sendRedirect("../tela/index.jsp");
    }


    Cliente p = new Cliente();
    List<Cliente> clientes = p.ListarTodos();
    int tamanholista = clientes.size();
  
%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" type="text/css" href="../css/estilocadastrar.css">
        <link rel="stylesheet" href="../css/estilo.css" />
        <link rel="stylesheet" href="../css/bootstrap.css" />
        <link rel="stylesheet" href="../css/estilocontato.css"/>


        <!--Fontawesome CDN-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

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
                        <td width="4px"><a class="btn btn-success" href="login.jsp" role="button"><b>Login</b></a></td>
                        <td class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false">
                                Lista
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item" href="../telauser/listaruser.jsp">Lista do Usuario</a>
                                <a class="dropdown-item" href="../telauser/listarponto.jsp">Lista do Ponto</a>
                                <a class="dropdown-item" href="../telauser/listaritens.jsp">Lista do Item</a>
                                <a class="dropdown-item" href="../telauser/listarcontato.jsp">Lista do Contato</a>
                            </div>
                        </td>

                    </table>
                </td>
                <td><div class="espaco"></div></td>
            </tr>
        </table>

        <div class="align-content-center" class="container">
            <div class="row">
                <div class="col-md-2">                </div>
                <div class="col-md-8">


                    

                    <table class="table table-bordered">

                        <h1>Pontos de Coleta</h1>

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
                            <th>IMAGEM</th>
                            <th>BOTÃO</th>
                        </tr>
                        

                        <%                            
                            
                            for (int i = 0; i < tamanholista; i++) {

                                out.print("<tr>");

                                out.print("<td>");
                                out.print(clientes.get(i).getId());
                                out.print("</td>");

                                out.print("<td>");
                                out.print(clientes.get(i).getUser().getId());
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

                                out.print("<td>");
                                out.print(clientes.get(i).getImagem());
                                out.print("</td>");

                                out.print("<td>");

                                out.print("<div style='display:inline-block'>");
                                out.print("<form action='cadastrarponto.jsp' method='POST'>");
                                out.print("<input name='acao' type='hidden' value='editar' />");
                                out.print("<input name='idusuario' type='hidden' value='" + clientes.get(i).getId() + "' />");
                                out.print("<button class='btn btn-info'type='submit'>Editar</button>");
                                out.print("</form>");
                                out.print("</div>");

                                out.print("&nbsp;");
                                out.print("&nbsp;");

                                out.print("<div style='display:inline-block'>");
                                out.print("<form action='../ClienteServlet' method='POST'>");
                                out.print("<input name='acao' type='hidden' value='apagar' />");
                                out.print("<input name='idponto' type='hidden' value='" + clientes.get(i).getId() + "' />");
                                out.print("<button class='btn btn-danger' type='submit'>Deletar</button>");
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
        <script type="text/javascript" src="../js/jquery.js"></script>
        <script type="text/javascript" src="../js/popper.js"></script>
        <script type="text/javascript" src="../js/bootstrap.js"></script>
        <script type="text/javascript" src="../js/jquery.mask.js"></script>


    </body>
</html>
