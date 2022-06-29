<%-- 
    Document   : contato.jsp
    Created on : 18/04/2022, 12:29:40
    Author     : cdi
--%>
<%@page import="modelo.Contato"%>
<%@page import="modelo.Usuario"%>
<%

    String acao = "cadastrar", nome = "", dddtelefone = "", email = "",
            idusuario = "", assunto = "", mensagem = "", dtcadastro = "", caminhoacao = "../ContatoServletUser";;

    Contato co = new Contato();

    if (request.getParameter("acao") != null) {
        if (request.getParameter("acao").equals("editar")) {

            idusuario = request.getParameter("idusuario");
            caminhoacao = "../ContatoServletUser";
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

<%    String nome2 = "";
    session = request.getSession();

    if (session.getAttribute("user") != null) {
        Usuario user = (Usuario) session.getAttribute("user");
        nome2 = user.getNome();

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
        <link rel="stylesheet" type="text/css" href="../css/estilocadastrar.css">
        <link rel="stylesheet" href="../css/estilo.css" />
        
        <link rel="stylesheet" href="../css/estilocontato.css"/>



        <!--Fontawesome CDN-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">

        <title>Ecovix Contato</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    </head>
    <body>



        <div class="btn-group drop col-1">
            <button type="button"
                    class="btn btn-success dropdown-toggle"
                    data-toggle="dropdown"
                    aria-expanded="false"
                    style="text-align: center">
                <%=nome2%>
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
                                value="Solicitacao">Solicitacoes</option>
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
        <script type="text/javascript" src="../js/bootstrap.js"></script>
        <script type="text/javascript" src="../js/jquery.js"></script>
        <script type="text/javascript" src="../js/jquery.mask.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {

                $("#txtDddTelefone").mask("(00) 00000-0000");
            });

        </script>

        <script type="text/javascript" src="../js/jquery.js"></script>
        <script type="text/javascript" src="../js/popper.js"></script>
        <script type="text/javascript" src="../js/bootstrap.js"></script>
        <script type="text/javascript" src="../js/jquery.mask.js"></script>
    </body>
</html>
