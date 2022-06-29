<%-- 
    Document   : pesquisar
    Created on : 29/06/2022, 09:31:06
    Author     : sala303b
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String nome = "";
    List<Cliente> pontosbuscados = new ArrayList();
    HttpSession sess = request.getSession();

    if (request.getParameter("estado") != null) {
        String estado = request.getParameter("estado");
        pontosbuscados = new Cliente().BuscarPorEstado(estado);
    }


%>

<!DOCTYPE html>

<html>
    <head>
        <title>Ecovix</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../css/bootstrap.css" />
        <link rel="stylesheet" href="../css/estilo.css" />
    </head>
    <body>
        <table>
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
                        <td width="4px"><a class="user " href="#" role="button"><b><%=nome%></b></a></td>
                        <td width="4px"> <a href="indexuser.jsp?logout=true" class="btn btn-success btn-float-right">Sair</a></td>
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

        <div class="container">

            <div class="row">
                <div class="col-4">

                    <form action="" method="POST">
                        <select class="form-control" id="estado" name="estado">
                            <option value="AC">Acre</option>
                            <option value="AL">Alagoas</option>
                            <option value="AP">Amapá</option>
                            <option value="AM">Amazonas</option>
                            <option value="BA">Bahia</option>
                            <option value="CE">Ceará</option>
                            <option value="DF">Distrito Federal</option>
                            <option value="ES">Espírito Santo</option>
                            <option value="GO">Goiás</option>
                            <option value="MA">Maranhão</option>
                            <option value="MT">Mato Grosso</option>
                            <option value="MS">Mato Grosso do Sul</option>
                            <option value="MG">Minas Gerais</option>
                            <option value="PA">Pará</option>
                            <option value="PB">Paraíba</option>
                            <option value="PR">Paraná</option>
                            <option value="PE">Pernambuco</option>
                            <option value="PI">Piauí</option>
                            <option value="RJ">Rio de Janeiro</option>
                            <option value="RN">Rio Grande do Norte</option>
                            <option value="RS">Rio Grande do Sul</option>
                            <option value="RO">Rondônia</option>
                            <option value="RR">Roraima</option>
                            <option value="SC">Santa Catarina</option>
                            <option value="SP">São Paulo</option>
                            <option value="SE">Sergipe</option>
                            <option value="TO">Tocantins</option>
                            <option value="EX">Estrangeiro</option>
                        </select>
                        <button type="submit" class="btn btn-dark">
                            <i class="fas fa-search"></i> Buscar 
                        </button>
                    </form>
                </div>
                <div class="col-4">

                </div>
                <div class="col-4">

                </div>
            </div>               

        </div>

        <table class="table table-bordered">

            <h1>Pontos de Coleta</h1>

            <%

                if (pontosbuscados.size() > 0) { %>


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

            </tr>


            <%
                    for (Cliente ponto : pontosbuscados) {

                        out.print("<tr>");

                        out.print("<td>");
                        out.print(ponto.getId());
                        out.print("</td>");

                        out.print("<td>");
                        out.print(ponto.getUser().getId());
                        out.print("</td>");

                        out.print("<td>");
                        out.print(ponto.getUf());
                        out.print("</td>");

                        out.print("<td>");
                        out.print(ponto.getBairro());
                        out.print("</td>");

                        out.print("<td>");
                        out.print(ponto.getCidade());
                        out.print("</td>");

                        out.print("<td>");
                        out.print(ponto.getComplemento());
                        out.print("</td>");

                        out.print("<td>");
                        out.print(ponto.getNumero());
                        out.print("</td>");

                        out.print("<td>");
                        out.print(ponto.getCep());
                        out.print("</td>");

                        out.print("<td>");
                        out.print(ponto.getLogradouro());
                        out.print("</td>");

                        out.print("<td>");
                        out.print(ponto.getImagem());
                        out.print("</td>");

                        out.print("</tr>");

                    }
                }


            %>

        </table>           



        <script type="text/javascript" src="../js/jquery.js"></script>
        <script type="text/javascript" src="../js/popper.js"></script>
        <script type="text/javascript" src="../js/bootstrap.js"></script>
        <script type="text/javascript" src="../js/jquery.mask.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.quicksearch/2.3.1/jquery.quicksearch.js"></script>
    </body>
</html>
