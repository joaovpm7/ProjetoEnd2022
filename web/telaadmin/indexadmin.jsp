
<%@page import="modelo.Usuario"%>
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
                <%=nome%>
            </button>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="../telaadmin/listaruseradmin.jsp">Listar Usuarios</a>
                <a class="dropdown-item" href="../telaadmin/listarpontoadmin.jsp">Listar Pontos De Coletas</a>
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
        <div class="container">
            <div class="row" style="margin-right: -205px;
                 margin-left: -85px;">
                <div class="col">
                    <div class="mainmsg">
                        <h1 class="msg">
                            <b>Seu marketplace de<br>coleta de resíduos</b>
                            <br>
                            <p>Ajudamos pessoas a encontrarem pontos de coleta<br> de forma eficiente</p>
                        </h1>
                        <br>
                        <br>
                        <br>
                        <a class="btn1 btn-success btn-lg" href="../tela/cadastraruser.jsp" role="button"><b>Cadastre um ponto de coleta</b></a>
                        <a class="btn btn-success btn-lg" href="cadastrarponto.jsp" role="button"><b>Pesquise um ponto de coleta</b></a>
                    </div>  
                </div>
                <br>
                <div class="col">
                    <div class="imgtemple">
                        <img src="../img/img01.jpg" />
                    </div>
                </div>
            </div>
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

        <script type="text/javascript" src="../js/jquery.js"></script>
        <script type="text/javascript" src="../js/popper.js"></script>
        <script type="text/javascript" src="../js/bootstrap.js"></script>
        <script type="text/javascript" src="../js/jquery.mask.js"></script>

    </body>
</html>
