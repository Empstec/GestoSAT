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

import GestoSAT.GestoSAT;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author S
 */
public class saveChangeCita extends HttpServlet {

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
                
                String[] fch_aux = request.getParameter("fecha").split(" ");
                String[] temps = fch_aux[4].split(":");
                int mes = 0;
                switch(fch_aux[1]){
                    case "Febrero":
                        mes = 1;
                        break;
                    case "Marzo":
                        mes = 2;
                        break;
                    case "Abril":
                        mes = 3;
                        break;
                    case "Mayo":
                        mes = 4;
                        break;
                    case "Junio":
                        mes = 5;
                        break;
                    case "Julio":
                        mes = 6;
                        break;
                    case "Agosto":
                        mes = 7;
                        break;
                    case "Semptiembre":
                        mes = 8;
                        break;
                    case "Octubre":
                        mes = 9;
                        break;
                    case "Noviembre":
                        mes = 10;
                        break;
                    case "Diciembre":
                        mes = 11;
                        break;
                };
                
                if(gestor.editarCita(request.getParameter("id"),
                        request.getParameter("observacionesEntrada"),
                        new Date(Integer.parseInt(fch_aux[2])-1900,
                        mes,Integer.parseInt(fch_aux[0]),Integer.parseInt(temps[0]),
                        Integer.parseInt(temps[1])),
                        request.getParameter("motivo"),
                        request.getParameter("observacionesCita"),
                        request.getParameter("empleados")))
                    out.print(true);
                else
                    out.print(false);
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
