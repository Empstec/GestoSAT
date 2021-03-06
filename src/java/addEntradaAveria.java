/*  This file is part of GestoSAT.
*
*    GestoSAT is free software: you can redistribute it and/or modify
*    it under the terms of the GNU General Public License as published by
*    the Free Software Foundation, either version 3 of the License, or
*    (at your option) any later version.
*
*    GestoSAT is distributed in the hope that it will be useful,
*    but WITHOUT ANY WARRANTY; without even the implied warranty of
*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*    GNU General Public License for more details.
*
*    You should have received a copy of the GNU Affero General Public License
*    along with GestoSAT.  If not, see <http://www.gnu.org/licenses/>.
* 
*    Salvador Puertes Aleixandre, July 2016
*
*/


import GestoSAT.Aparato;
import GestoSAT.Averia;
import GestoSAT.Cliente;
import GestoSAT.Entrada;
import GestoSAT.GestoSAT;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author S
 */
public class addEntradaAveria extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession ses = request.getSession();
            GestoSAT gestor = (GestoSAT)ses.getAttribute("gestor");
            
            Entrada e;
            Averia av;
            int id_Entrada=0, id_Aparato=0;
                
            if(request.getParameter("id_Cliente").equals("0")){
                Cliente c = new Cliente(request.getParameter("nombre"),
                        request.getParameter("apellidos"), request.getParameter("dni"),
                        request.getParameter("provincia"), request.getParameter("poblacion"),
                        Integer.parseInt(request.getParameter("cp")), request.getParameter("calle"),
                        request.getParameter("numero"), request.getParameter("escalera"),
                        Integer.parseInt(request.getParameter("piso")), request.getParameter("puerta"),
                        Integer.parseInt(request.getParameter("tlfCasa")), 
                        Integer.parseInt(request.getParameter("tlfMovil")),
                        request.getParameter("correo"), request.getParameter("observaciones"),gestor);
                int id_Cliente=c.crearCliente();
                
                Aparato ap = new Aparato(request.getParameter("tipo"),request.getParameter("marca"),
                        request.getParameter("modelo"), request.getParameter("color"),
                        request.getParameter("nSerie"), request.getParameter("observacionesAparato"),c);
                id_Aparato = gestor.guardarAparato(ap,id_Cliente);
                e = new Entrada(request.getParameter("observacionesEntrada"),request.getParameter("lugar"),gestor,c);
                av = new Averia(request.getParameter("motivo"), request.getParameter("observacionesAparato"),ap,e); 
            }else{
                int id_Cliente = Integer.parseInt(request.getParameter("id_Cliente"));
                Cliente c = gestor.getCliente(id_Cliente);
                if(request.getParameter("id_Aparato").equals("0")){
                    Aparato ap = new Aparato(request.getParameter("tipo"),request.getParameter("marca"),
                        request.getParameter("modelo"), request.getParameter("color"),
                        request.getParameter("nSerie"), request.getParameter("observacionesAparato"),c);
                    id_Aparato = gestor.guardarAparato(ap,id_Cliente);
                    e = new Entrada(request.getParameter("observacionesEntrada"),request.getParameter("lugar"),gestor,c);
                    av = new Averia(request.getParameter("motivo"), request.getParameter("observacionesAparato"),ap,e); 
                }else{
                    id_Aparato = Integer.parseInt(request.getParameter("id_Aparato"));
                    e = new Entrada(request.getParameter("observacionesEntrada"),request.getParameter("lugar"),gestor,c);
                    av = new Averia(request.getParameter("motivo"), request.getParameter("observacionesAparato"),c.getAparato(id_Aparato),e); 
                }
            }
            id_Entrada = gestor.guardarEntrada(e,(Integer)ses.getAttribute("id"));
            gestor.guardarAveria(av, id_Entrada, id_Aparato);
            out.print(id_Entrada);
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
