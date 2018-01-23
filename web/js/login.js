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


$(document).on("click","#acceder",function(){
    if($("#correo").val() != "" && $("#pass").val() != "")
    {  
        var userData = {
            usuario:$("#correo").val(),
            pass:$("#pass").val()
        };
        $.ajax({
            url:"acceso",
            type:"POST",
            data:userData,
            success:function(respuesta){
                if(respuesta =="true")
                    if($("#correo").val()=="admin@default.es")
                        window.location.href = "primerAcceso.jsp";
                    else
                        window.location.href = "home.jsp";
                else
                    $("#error").modal("show");
            }
        });
    }
}); 