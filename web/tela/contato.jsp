<%-- 
    Document   : contato.jsp
    Created on : 18/04/2022, 12:29:40
    Author     : cdi
--%>



<%@page import="modelo.Contato"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%

    String acao = "cadastrar", nome = "", dddtelefone = "", email = "",
            idusuario = "", assunto = "", mensagem = "", dtcadastro = "", caminhoacao = "../ContatoServlet";;

    Contato co = new Contato();

    if (request.getParameter("acao") != null) {
        if (request.getParameter("acao").equals("editar")) {

            idusuario = request.getParameter("idusuario");
            caminhoacao = "../ContatoServlet";
            boolean achou = co.BuscarPorId(idusuario);
            if (!achou) {
                out.print("<script>"
                        + "window.alert('Cliente não Encontrado');"
                        + "</script>");
            } else {
                acao = "editar";
                idusuario = String.valueOf(co.getIdusuario());
                nome = co.getNome();
                email = co.getEmail();
                mensagem = co.getMensagem();
                assunto = co.getAssunto();
                dddtelefone = co.getTelefone();
                dtcadastro = String.valueOf(co.getDataCadastro());
            }
        }
    }


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ecovix Contato</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" type="text/css" href="../css/estilocadastrar.css">
        <link rel="stylesheet" href="../css/estilo.css" />
        <link rel="stylesheet" href="../css/bootstrap.css" />
        <link rel="stylesheet" href="../css/estilocontato.css"/>


        <!--Fontawesome CDN-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">

    </head>
    <body>   
       
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
                        <td width="4px"><a class="btn btn-success" href="index.jsp" role="button"><b>Home</b></a></td>
                        <td width="4px"><a class="btn btn-success" href="sobre.jsp" role="button"><b>Sobre</b></a></td>
                        <td width="4px"><a class="btn btn-success" href="contato.jsp" role="button"><b>Contato</b></a></td>
                        <td width="4px"><a class="btn btn-success" href="login.jsp" role="button"><b>Login</b></a></td>
                    </table>
                    <img class="logoffsuario"src="../img/indice.png" style="width: 65.99px; height: 65.99px;" title=" Deslogado"/>
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
            <form action="<%=caminhoacao%>" method="POST">
                <input type="hidden" name="acao" value="<%= acao%>"/>
                <input type="hidden" name="idusuario" value="<%= idusuario%>"/> 

                <div class="mainmsg msgcontato">
                    <h1 class="msg">Fale conosco</h1>
                </div>
                <br><br>
                <div class="centercont">

                    <div class="col-7">
                        <label for="txtNome" class="mainmsg" >Nome:</label>
                        <input type="text"  
                               value="<%= nome%>"
                               name="nome" class="form-control" id="txtNome">
                    </div>
                    <br>
                    <div class="col-7">
                        <label for="inputEmail">Email:</label>
                        <input type="email"  
                               value="<%= email%>"
                               name="email"  class="form-control" id="inputEmail">
                    </div>
                    <br>
                    <div class="col-7">
                        <label for="txtDddTelefone" >Telefone:</label>
                        <input type="text"  
                               value="<%= dddtelefone%>"
                               name="dddtelefone" class="form-control" id="txtDddTelefone">
                    </div>
                    <br>
                    <div class="form-group col-7">
                        <label id="sltAssunto" for="txtAssunto">Assunto da mensagem:</label>
                        <select required 
                                multiple 
                                id="sltAssunto"
                                name="assunto"
                                value="<%= assunto%>"
                                class="form-control">
                            <option <%= assunto.equals("") ? "selected" : ""%>
                                value="">Selecione</option>
                            <option <%= assunto.equals("Elogio") ? "selected" : ""%>
                                value="Elogio">Elogios</option>
                            <option <%= assunto.equals("Sugestao") ? "selected" : ""%>
                                value="Sugestao">Sugestoes</option>
                            <option <%= assunto.equals("Reclamacao") ? "selected" : ""%>
                                value="Reclamacao">Reclamacoes</option>
                            <option <%= assunto.equals("Solicitacao") ? "selected" : ""%>
                                value="Solicitacao">Solicitações</option>
                        </select>
                    </div>                   
                    <br>
                    <div class="form-group col-9">
                        <label for="txtMensagem">Mensagem:</label>
                        <textarea class="form-control" 
                                  id="txtMensagem"
                                  name="mensagem"
                                  value="<%=mensagem%>"
                                  rows="3"></textarea>
                    </div>  
                </div>
                <hr>
                <div class="btncontato">
                    <button type="submit" class="btn btn-success"><%=acao%></button>
                </div>
                <br>
                <br>
                <br>
                <br>
            </form> 
        </div>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
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
        <script type="text/javascript" src="../js/bootstrap.js"></script>
        <script type="text/javascript" src="../js/jquery.js"></script>
        <script type="text/javascript" src="../js/jquery.mask.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {

                $("#txtDddTelefone").mask("(00) 00000-0000");
            });

        </script>
    </body>
</html>
