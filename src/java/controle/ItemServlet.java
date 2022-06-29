/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import modelo.Ponto_item;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Cliente;
import modelo.Itens;

/**
 *
 * @author sala303b
 */
@WebServlet(name = "ItemServlet", urlPatterns = {"/ItemServlet"})
public class ItemServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("acao") != null) {
            if (request.getParameter("acao").equals("cadastrar")) {

                String idponto = request.getParameter("idponto");
                String[] iditens = request.getParameterValues("iditens");

                Ponto_item pti = new Ponto_item();

                Cliente cli = new Cliente();//ponto
                cli.setId(Long.parseLong(idponto));
                pti.setIdponto(cli);
                
                for (int i = 0; i < iditens.length; i++) {
                    Itens it = new Itens();//item
                    it.setId(Long.parseLong(iditens[i]));
                    pti.setIditem(it);

                    pti.Cadastrar();
                }
               response.sendRedirect("telauser/indexuser.jsp");

            }else if (request.getParameter("acao").equals("editar")) {

                Itens i = new Itens();
                
                 i.setId(Long.parseLong(request.getParameter("idponto")));

                boolean atualizou = i.Atualizar();
                if (atualizou) {
                    request.setAttribute("idponto", i.getId());
                    response.sendRedirect("telauser/listaruser.jsp");
                } else {
                    String mensagem
                            = "<h1>Edição não Efetuado com Sucesso</h1>";
                    response.getWriter().print(mensagem);
                }
            }else if (request.getParameter("acao").equals("apagar")) {

            Itens i = new Itens();
            long id = Long.parseLong(request.getParameter("id"));

//                long idusuario = Long.parseLong(request.getParameter("idusuario"));
            i.setId(Long.parseLong(request.getParameter("idponto")));

            boolean apagou = i.Excluir(id);

            if (apagou) {
                request.setAttribute("idponto", i.getId());
                response.sendRedirect("telauser/listaruser.jsp");
            } else {
                String mensagem
                        = "<h1>Exclusão não Efetuado</h1>";
                response.getWriter().print(mensagem);
            }
        }
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
