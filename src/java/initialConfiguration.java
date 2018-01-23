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


import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import GestoSAT.GestoSAT;
import GestoSAT.Gerente;
/**
 *
 * @author S
 */
public class initialConfiguration extends HttpServlet {

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
            Gerente gerente = gestor.configuracionInicial(request.getParameter("nombre"),
                request.getParameter("apellidos"), request.getParameter("dni"),
                request.getParameter("poblacion"), request.getParameter("provincia"),
                Integer.parseInt(request.getParameter("cp")), request.getParameter("calle"),
                request.getParameter("numero"),request.getParameter("escalera"),
                Integer.parseInt(request.getParameter("piso")), request.getParameter("puerta"),
                Integer.parseInt(request.getParameter("tlfCasa")),
                Integer.parseInt(request.getParameter("tlfMovil")),
                Float.parseFloat(request.getParameter("sueldo")),
                Float.parseFloat(request.getParameter("hora")), request.getParameter("correo"),
                request.getParameter("pass"),request.getParameter("nombreEmp"),request.getParameter("nif"),
                request.getParameter("poblacionEmp"),request.getParameter("provinciaEmp"),
                Integer.parseInt(request.getParameter("cpEmp")), request.getParameter("calleEmp"),
                request.getParameter("numeroEmp"),request.getParameter("correoEmp"),
                Integer.parseInt(request.getParameter("tlfCasaEmp")),
                Integer.parseInt(request.getParameter("tlfMovilEmp")),
                Integer.parseInt(request.getParameter("faxEmp")),
                request.getParameter("ipMySQL"),
                Integer.parseInt(request.getParameter("puertoMySQL")),
                request.getParameter("userMySQL"), request.getParameter("passMySQL"),
                request.getParameter("ipFTP"), Integer.parseInt(request.getParameter("puertoFTP")),
                request.getParameter("userFTP"), request.getParameter("passFTP"),
                Integer.parseInt(request.getParameter("iva")));
            
            if(gerente != null){
                ses.setAttribute("usuario",gerente);
                out.print(true);
            }else{
                out.print(false);
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
        response.sendRedirect("../index.jsp");
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
        return "Acces Denied";
    }// </editor-fold>
}
