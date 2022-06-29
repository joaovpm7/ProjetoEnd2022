<%-- 
    Document   : login
    Created on : 05/04/2022, 10:56:04
    Author     : sala306b
--%>

<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    String acao = "cadastrar", idusuario = "", login = "",
            senha = "", nome = "", dtcadastro = "", caminhoacao = "../UsuarioServletAdmin", dddtelefone = "",
            email = "", documento = "", dtnascimento = "", tipopessoa = "PF";

    Usuario us = new Usuario();

    if (request.getParameter("acao") != null) {
        if (request.getParameter("acao").equals("editar")) {

            idusuario = request.getParameter("idusuario");
            caminhoacao = "../UsuarioServletAdmin";
            
            us.setId(Long.parseLong(idusuario));
            
            boolean achou = us.BuscarPorId();
            if (!achou) {
                out.print("<script>"
                        + "window.alert('Cliente não Encontrado');"
                        + "</script>");

            } else {
                acao = "editar";
                idusuario = String.valueOf(us.getId());
                tipopessoa = us.getTprequerente();
                dddtelefone = us.getTelefone();
                email = us.getEmail();
                documento = us.getDocumento();
                login = us.getLogin();
                senha = us.getSenha();
                nome = us.getNome();
                dtcadastro = String.valueOf(us.getDataCadastro());
                dtnascimento = String.valueOf(us.getDtnascimento());
            }
        }
    }
%>

<%
    String nomea = "";
    session = request.getSession();

    if (session.getAttribute("user") != null) {
        Usuario user = (Usuario) session.getAttribute("user");
        nomea = user.getNome();

        if (request.getParameter("logout") != null) {

            session = request.getSession();
            session.invalidate();
            response.sendRedirect("../tela/index.jsp");

        }
    } else {
        response.sendRedirect("../tela/index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Ponto</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../css/estilo.css" />

        <link rel="stylesheet" href="../css/bootstrap.css" />

        <!--Custom styles-->
        <link rel="stylesheet" type="text/css" href="../css/estilocadastrar.css">
        <!--Fontawesome CDN-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">

    </head>
    <body>
        <img class="logousuario" src="../img/logousuario.jpg" />


        <div class="btn-group drop col-1">
            <button type="button"
                    class="btn btn-success dropdown-toggle"
                    data-toggle="dropdown"
                    aria-expanded="false"
                    style="text-align: center">
                <%=nomea%>
            </button>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="../telauser/listaruser.jsp">Editar Perfil</a>
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
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <div class="container">           
            <form action="<%= caminhoacao%>" method="POST">
                <input type="hidden" name="acao" value="<%= acao%>"/>
                <input type="hidden" name="idusuario" value="<%= idusuario%>"/>  


                <h1>Dados do usuario</h1> 
                <fieldset class="form-group row">
                    <legend class="col-form-label col-sm-2 float-sm-left pt-0">Tipo do Requerente</legend>
                    <div class="col-sm-10">
                        <div id="divfisica" class="form-check">
                            <input required id="pessoaF" class="form-check-input" 
                                   <%= tipopessoa.equals("PF") ? "checked" : ""%>
                                   type="radio" name="tipopessoa" value="PF"/>
                            <label id="text" class="form-check-label" for="pessoaF">
                                Pessoa Física
                            </label>
                        </div>
                        <div id="divjuridica" class="form-check">
                            <input required id="pessoaJ" class="form-check-input" 
                                   <%= tipopessoa.equals("PJ") ? "checked" : ""%>
                                   type="radio" name="tipopessoa" value="PJ"/>
                            <label id="text" class="form-check-label" for="pessoaJ">
                                Pessoa Jurídica
                            </label>
                        </div>
                    </div>
                </fieldset>

                <div class="row">
                    <div class="col">
                        <label id="lblnomecad" for="lblnome" >Nome:</label><br/>
                        <input class="form-control" required size="30"  value="<%=nome%>"
                               type="text" name="nomecad" />
                    </div>
                    <div class="col">
                        <label for="">Login:</label><br/>
                        <input class="form-control" required size="30"  value="<%=login%>"
                               type="text" name="logincad" />
                    </div>
                    <div class="col">
                        <label for="">Senha:</label><br/>
                        <input class="form-control" required size="30"  value="<%=senha%>"
                               type="password" name="senhacad" />
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col">
                        <label for="txtDddTelefone" >Telefone:</label>
                        <input type="text"  
                               value="<%= dddtelefone%>"
                               name="dddtelefone" class="form-control" id="txtDddTelefone">
                    </div>
                    <div class="col">
                        <label for="inputEmail">Email:</label>
                        <input type="email"  
                               value="<%= email%>"
                               name="email"  class="form-control" id="inputEmail">
                    </div>
                    <div class="col">
                        <label id="lblDocumento" for="inputDocumento">Documento:</label>
                        <input type="text"  
                               value="<%= documento%>"
                               name="documento"  class="form-control" id="inputDocumento">
                    </div>
                </div>
                <br>
                <div class="">
                    <div class="row">
                        <div class="col-3">
                            <label for="dataNascimento">Data de Nascimento:</label>
                            <input type="date"  
                                   value="<%= dtnascimento%>"
                                   name="dtnascimento"  class="form-control" id="dataNascimento">
                        </div>
                    </div>
                </div>
                <br><br>
                <div class="container">
                    <div class="row">
                        <div class="col-2">
                            <button id="btn" type="submit" class="btn btn-success btn-lg btn-block"><%= acao%></button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <footer class="bg-sucess text-center text-white" style="background-color: #28a745">
            <!-- Grid container -->
            <div class="container p-4">
                <!-- Section: Social media -->
                <section class="mb-4">
                    <!-- Facebook -->
                    <a class="btn btn-outline-light btn-floating m-1" href="https://pt-br.facebook.com/" role="button"
                       ><i class="fab fa-facebook-f"></i
                        ></a>

                    <!-- Twitter -->
                    <a class="btn btn-outline-light btn-floating m-1" href="https://twitter.com/TwitterBrasil?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor" role="button"
                       ><i class="fab fa-twitter"></i
                        ></a>

                    <!-- Google -->
                    <a class="btn btn-outline-light btn-floating m-1" href="https://www.google.com.br/" role="button"
                       ><i class="fab fa-google"></i
                        ></a>

                    <!-- Instagram -->
                    <a class="btn btn-outline-light btn-floating m-1" href="https://www.instagram.com/" role="button"
                       ><i class="fab fa-instagram"></i
                        ></a>

                    <!-- Linkedin -->
                    <a class="btn btn-outline-light btn-floating m-1" href="https://www.linkedin.com/feed/" role="button"
                       ><i class="fab fa-linkedin-in"></i
                        ></a>

                    <!-- Github -->
                    <a class="btn btn-outline-light btn-floating m-1" href="https://github.com/" role="button"
                       ><i class="fab fa-github"></i
                        ></a>
                </section>
                <!-- Section: Social media -->

                <!-- Section: Form -->
                <section class="">
                    <form action="">
                        <!--Grid row-->
                        <div class="row d-flex justify-content-center">
                            <!--Grid column-->
                            <div class="col-auto">
                                <p class="pt-2">
                                    <strong>Assine nosso boletim digital</strong>
                                </p>
                            </div>
                            <!--Grid column-->

                            <!--Grid column-->
                            <div class="col-md-5 col-12">
                                <!-- Email input -->
                                <div class="form-outline form-white mb-4">
                                    <input type="email" id="form5Example21" class="form-control" />
                                    <label class="form-label" for="form5Example21">Endereço de Email</label>
                                </div>
                            </div>
                            <!--Grid column-->

                            <!--Grid column-->
                            <div class="col-auto">
                                <!-- Submit button -->
                                <button type="submit" class="btn btn-outline-light mb-4">
                                    Increver
                                </button>
                            </div>
                            <!--Grid column-->
                        </div>
                        <!--Grid row-->
                    </form>
                </section>
                <!-- Section: Form -->

                <!-- Section: Text -->
                <section class="mb-4">
                    <p style="color:white">
                        Pessoas, Planeta, Prosperidade, Paz e Parcerias são os 5 pilares dos Objetivos de Desenvolvimento Sustentável
                    </p>
                </section>

                <br/>
                <br/>
                <br/>
                <br/>
                <!-- Section: Text -->

                <!-- Section: Links -->
                <section class="">
                    <!--Grid row-->
                    <div class="row">
                        <!--Grid column-->
                        <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                            <h5 class="text-uppercase">Dowloads</h5>

                            <ul class="list-unstyled mb-0">
                                <li>
                                    <a href="#!" class="text-white">Manual do site</a>
                                </li>

                                <li>
                                    <a href="#!" class="text-white">Relatorio das Nações Unidas</a>
                                </li>
                                <li>
                                    <a href="#!" class="text-white">Agenda 2030 para Desenvolvimento sustentavel</a>
                                </li>
                            </ul>
                        </div>
                        <!--Grid column-->

                        <!--Grid column-->
                        <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                            <h5 class="text-uppercase">CONTATO</h5>

                            <ul class="list-unstyled mb-0">
                                <li>
                                    <a href="#!" class="text-white"> Telefone(27) 4002-8922</a>
                                </li>
                                <li>
                                    <a href="#!" class="text-white">Email ecovix@sustent.com</a>
                                </li>


                            </ul>
                        </div>
                        <!--Grid column-->

                        <!--Grid column-->
                        <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                            <h5 class="text-uppercase">OPORTUNIDADES</h5>

                            <ul class="list-unstyled mb-0">
                                <li>
                                    <a href="#!" class="text-white">Trabalhe Conosco</a>
                                </li>
                                <li>
                                    <a href="#!" class="text-white">Vagas disponiveis</a>
                                </li>
                                <li>
                                    <a href="#!" class="text-white">Voluntariado</a>


                                </li>

                            </ul>
                        </div>
                        <!--Grid column-->

                        <!--Grid column-->
                        <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                            <h5 class="text-uppercase">PARCERIAS</h5>

                            <ul class="list-unstyled mb-0">
                                <li>
                                    <a href="https://doe.wwf.org.br/manifesto?utm_source=google&utm_me
                                       dium=cpc&utm_campaign=2022_abr_olivasdigital_search_manifesto_d
                                       oacao_cpc&utm_content=2022_abr_olivasdigital_search_manifesto_d
                                       oacao_cpc_-_google_ambiente_-_search_doe&gclid=EAIaIQobChMI1ZL6
                                       _uHN-AIVFNWRCh2NwwCcEAAYASAAEgKNa_D_BwE" class="text-white">WWF Brasil</a>
                                </li>
                                <li>
                                    <a href="https://www.recicloteca.org.br/projetos/reciclagem-solidaria-cooperativas/" class="text-white">Recicloteca</a>
                                </li>
                                <li>
                                    <a href="#!" class="text-white">Seja Um Apoiador</a>
                                </li>

                            </ul>
                        </div>
                        <!--Grid column-->
                    </div>
                    <!--Grid row-->
                </section>
                <!-- Section: Links -->
            </div>
            <!-- Grid container -->

            <!-- Copyright -->
            <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
                © 2020 Copyright:
                <a class="text-white" href="https://mdbootstrap.com/">ECOVIX SA</a>
            </div>
            <!-- Copyright -->
        </footer>
        <!-- Footer -->
        <script type="text/javascript" src="../js/jquery.js"></script>
        <script type="text/javascript" src="../js/bootstrap.js"></script>
        <script type="text/javascript" src="../js/jquery.mask.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {

                $("#inputDocumento").mask("000.000.000-00");
                $("#txtDddTelefone").mask("(00) 00000-0000");
                $("#lblDocumento").html("CPF:");

                $("#divfisica").on("click", function (e) {
                    $("#lblnomecad").html("Nome:");
                    $("#inputDocumento").mask("000.000.000-00");
                    $("#lblDocumento").html("CPF:");
                });
                $("#divjuridica").on("click", function (e) {
                    $("#lblnomecad").html("Jurídica:");
                    $("#inputDocumento").mask("00.000.000/0000-00");
                    $("#lblDocumento").html("CNPJ:");
                });

            });
        </script>
    </body>
</html>
