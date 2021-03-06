<%
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
%>
<%@page import="GestoSAT.Factura"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="GestoSAT.MaterialTrabajos"%>
<%@page import="GestoSAT.Trabajo"%>
<%@page import="GestoSAT.Cliente"%>
<%@page import="GestoSAT.Presupuesto"%>
<%@page import="java.util.Vector"%>
<%@page import="GestoSAT.GestoSAT"%>
<%@page import="GestoSAT.Empleado"%>
<%@page import="GestoSAT.Gerente"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page session='true'%>
<%@include file="cabecera.jsp" %>

<html lang="es">
    <head>
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Apliaci�n GestoSAt para la gesti�n de empresas SAT de electr�nica">
    <meta name="author" content="Puertes Aleixandre, Salvador">
    <link rel="shortcut icon" href="images/favicon.png">
    
    <title>Crear Recibo - GestoSAT</title>

    <!--Core CSS -->
    <link href="bs3/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="js/bootstrap-datetimepicker/css/datetimepicker.css" />
    <link rel="stylesheet" type="text/css" href="js/jquery-multi-select/css/multi-select.css" />
    <link href="js/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]>
    <script src="js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>



<section id="container" >
<!--header start-->
<header class="header fixed-top clearfix">
<!--logo start-->
<div class="brand">

    <a href="home.jsp" class="logo">
        <img src="images/logo.png" alt="GestoSAT">
    </a>
    <div class="sidebar-toggle-box toogle-left">
        <div class="fa fa-bars"></div>
    </div>
</div>
<!--logo end-->

<div class="nav notify-row" id="top_menu">
 
</div>
<div class="top-nav clearfix">
    <!--search & user info start-->
    <ul class="nav pull-right top-menu">
        <!-- user login dropdown start-->
        <li class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                <span class="username"><%
                Empleado e = (Empleado)ses.getAttribute("usuario");
                out.print(e.getApellidos() + ", "+ e.getNombre());
                %></span>
                <b class="caret"></b>
            </a>
            <ul class="dropdown-menu extended logout">
                <li><a href="profile.jsp"><i class=" fa fa-suitcase"></i>Editar datos personales</a></li>
                <% if(((Boolean)ses.getAttribute("gerente"))){ %>
                <li><a href="confApp.jsp"><i class="fa fa-cog"></i> Configurar aplicaci�n</a></li>
                <% } %>
                <li><a href="closeSession.jsp"><i class="fa fa-key"></i> Cerrar</a></li>
            </ul>
        </li>
        <!-- user login dropdown end -->
        <li>
            <div class="toggle-right-box">
                <div class="fa fa-bars"></div>
            </div>
        </li>
    </ul>
</div>
</header>
<!--header end-->
<aside>
    <div id="sidebar" class="nav-collapse">
        <!-- sidebar menu start-->
        <div class="leftside-navigation">
            <%@include file="menu.jsp" %>
        </div>        
<!-- sidebar menu end-->
    </div>
</aside>
<!--sidebar end-->
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
        <!-- page start-->

        <div class="row">
            <div class="col-sm-12">
                <section class="panel">
                    <header class="panel-heading">
                        <h3>Nuevo Recibo</h3>
                    </header>
                    <div class="panel-body">
                            <%
                                GestoSAT gestoSAT = (GestoSAT)ses.getAttribute("gestor");
                                int id = Integer.parseInt(request.getParameter("id"));
                                Factura factura = gestoSAT.getFactura(id);
                                Cliente cli = factura.getCliente();
                                
                            %>
                                <div class='form-entradas'>
                                        <h4>Datos Cliente</h4>
                                        <div class="cliente">    
                                            <div class="conf-attr">
                                                <div class="name-cat-conf">
                                                    <span class='attr-entries'>Nombre:</span>
                                                </div>
                                                <% out.print(cli.getNombre());%>
                                            </div>
                                            <div class="conf-attr">
                                                <div class="name-cat-conf">
                                                    <span class='attr-entries'>Apellidos:</span>
                                                </div>
                                                <% out.print(cli.getApellidos());%>
                                            </div>
                                            <div class="conf-attr">
                                                <div class="name-cat-conf">
                                                    <span class='attr-entries'>DNI:</span>
                                                </div>
                                                <% out.print(cli.getNif());%>
                                            </div>
                                            <div class="conf-attr">
                                                <div class="name-cat-conf">
                                                    <span class='attr-entries'>Provincia:</span>
                                                </div>
                                                <% out.print(cli.getProvincia());%>
                                            </div>
                                            <div class="conf-attr">
                                                <div class="name-cat-conf">
                                                    <span class='attr-entries'>Poblaci�n:</span>
                                                </div>
                                                <% out.print(cli.getPoblacion());%>
                                            </div>
                                            <div class="conf-attr">
                                                <div class="name-cat-conf">
                                                    <span class='attr-entries'>CP:</span>
                                                </div>
                                                <% out.print(cli.getCp());%>
                                            </div>
                                            <div class="conf-attr">
                                                <div class="name-cat-conf">
                                                    <span class='attr-entries'>Calle:</span>
                                                </div>
                                                <% out.print(cli.getCalle());%>
                                            </div>
                                            <div class="conf-attr">
                                                <div class="name-cat-conf">
                                                    <span class='attr-entries'>N�mero:</span>
                                                </div>
                                                <% out.print(cli.getNumero());%>
                                            </div>
                                            <div class="conf-attr">
                                                <div  class="name-cat-conf">
                                                    <span class='attr-entries'>Escalera:</span>
                                                </div>
                                                <% out.print(cli.getEscalera());%>
                                            </div>
                                            <div class="conf-attr">
                                                <div class="name-cat-conf">
                                                    <span class='attr-entries'>Piso:</span>
                                                </div>
                                                <% if(cli.getPiso()!=0)
                                                    out.print(cli.getNombre());%>
                                            </div>
                                            <div class="conf-attr">
                                                <div class="name-cat-conf">
                                                    <span class='attr-entries'>Puerta:</span>
                                                </div>
                                                    <% out.print(cli.getPuerta());%>
                                            </div>
                                            <div class="conf-attr">
                                                <div class="name-cat-conf">
                                                    <span class='attr-entries'>Tel�fono casa:</span>
                                                </div>
                                                    <% if(cli.getTlfFijo()!=0)
                                                        out.print(cli.getTlfFijo());%>
                                            </div>
                                            <div class="conf-attr">
                                                <div class="name-cat-conf">
                                                    <span class='attr-entries'>Tel�fono m�vil:</span>
                                                </div>
                                                <% if(cli.getTlfMovil()!=0)
                                                        out.print(cli.getTlfMovil());%>
                                            </div>
                                            <div class="conf-attr">
                                                <div class="name-cat-conf">
                                                    <span class='attr-entries'>Correo electr�nico:</span>
                                                </div>
                                                <% out.print(cli.getEmail());%>
                                            </div>
                                        </div>
                                </div>
                                
                        <div class="form-entradas">
                            <div>
                                <h4>Lugar de entrega</h4>
                                <div class="conf-attr">
                                    <div class="name-cat-conf">
                                        <span class="attr-entries">Entrega en:</span>
                                    </div>
                                    <select id="lugarEntrega">
                                        <option value="Domicilio">Domicilio cliente</option>
                                        <option value="Otro">Otro lugar</option>
                                        <option value="Tienda" selected>Tienda</option>
                                    </select>
                                </div>
                            </div>        
                                <div class="conf-attr">
                                                    <div class="name-cat-conf">
                                                        <span>Provincia:</span>
                                                    </div>
                                                    <input class="input-cat-conf entrega" type="text" id="provEntrega" value="<% out.print(e.getOficina().getProvincia());%>" disabled/>
                                                </div>
                                                <div class="conf-attr">
                                                    <div class="name-cat-conf">
                                                        <span>Poblaci�n:</span>
                                                    </div>
                                                    <input class="input-cat-conf entrega" type="text" id="pobEntrega" value="<% out.print(e.getOficina().getPoblacion());%>" disabled/>
                                                </div>
                                                <div class="conf-attr">
                                                    <div class="name-cat-conf">
                                                        <span>CP:</span>
                                                    </div>
                                                    <input class="input-cat-conf entrega" type="number" id="cpEntrega" value="<% out.print(e.getOficina().getCp());%>" disabled/>
                                                </div>
                                                <div class="conf-attr">
                                                    <div class="name-cat-conf">
                                                        <span>Calle:</span>
                                                    </div>
                                                    <input class="input-cat-conf entrega" type="text" id="calleEntrega" value="<% out.print(e.getOficina().getCalle());%>" disabled/>
                                                </div>
                                                <div class="conf-attr">
                                                    <div class="name-cat-conf">
                                                        <span>N�mero:</span>
                                                    </div>
                                                    <input class="input-cat-conf entrega" type="text" id="numEntrega" value="<% out.print(e.getOficina().getNumero());%>" disabled/>
                                                </div>
                                                <div class="conf-attr">
                                                    <div  class="name-cat-conf">
                                                        <span>Escalera:</span>
                                                    </div>
                                                    <input class="input-cat-conf entrega" type="text" id="escaleraEntrega" value="" disabled/>
                                                </div>
                                                <div class="conf-attr">
                                                    <div class="name-cat-conf">
                                                        <span>Piso:</span>
                                                    </div>
                                                    <input class="input-cat-conf num entrega" type="number" id="pisoEntrega" value="" disabled/>
                                                </div>
                                                <div class="conf-attr">
                                                    <div class="name-cat-conf">
                                                        <span>Puerta:</span>
                                                    </div>
                                                    <input class="input-cat-conf entrega" type="text" id="puertaEntrega" value="" disabled/>
                                                </div>
                                                <div class="conf-attr">
                                                    <div class="name-cat-conf">
                                                        <span>Observaciones:</span>
                                                   </div>
                                                   <input class="input-cat-conf" type="text" id="observaciones"/>
                                                </div>
                        </div>                        
                        <div class="button-div">
                            <button type='button' class='btn btn-primary sep' id="save">Guardar</button>
                            <button type='button' class='btn btn-primary sep' id="cancel">Cancelar</button>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <!-- page end-->
        </section>
    </section>
    <!--main content end-->
<!--right sidebar start-->
<div class="right-sidebar">
<div class="right-stat-bar">
<%@include file="recordatorio.jsp" %>
</div>
</div>
<!--right sidebar end-->

</section>

<!-- Modal -->

<div aria-hidden="true" aria-labelledby="empty" role="dialog" tabindex="-1" id="emptyValues" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <p>Debes rellenar todos los campos</p>
                <p>Si no hay domicilio registrado del cliente selecciona 'Otro lugar', si es un nuevo cliente, es suficiente con rellenar esos valores en su ficha.</p>
            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" class="btn btn-default" type="button">Cerrar</button>
            </div>
        </div>
      </div>
</div>

<div aria-hidden="true" aria-labelledby="error" role="dialog" tabindex="-1" id="errorSave" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <p>Se ha producido un error, vuelva a empezar</p>
            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" class="btn btn-default" type="button">Cerrar</button>
            </div>
        </div>
      </div>
</div>
<!-- Placed js at the end of the document so the pages load faster -->

<!--Core js-->
<script src="js/jquery.js"></script>
<script src="bs3/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript" src="js/jquery.dcjqaccordion.2.7.js"></script>
<script src="js/jquery.scrollTo.min.js"></script>
<script src="js/jQuery-slimScroll-1.3.0/jquery.slimscroll.js"></script>
<script src="js/jquery.nicescroll.js"></script>
<script type="text/javascript" src="js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="js/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
<script type="text/javascript" src="js/jquery-multi-select/js/jquery.multi-select.js"></script>
<script type="text/javascript" src="js/jquery-multi-select/js/jquery.quicksearch.js"></script>
<script src="js/iCheck/jquery.icheck.js"></script>
<script src="js/icheck-init.js"></script>
<script src="js/advanced-form.js"></script>

<!--common script init for all pages-->
<script src="js/scripts.js"></script>

<!-- My Scripts -->
<script type='text/javascript'>
    id=<%out.println(request.getParameter("id"));%>;
    entrega = {
        'tienda':{
            'provEntrega':'<% out.print(e.getOficina().getProvincia()); %>',
            'pobEntrega':'<% out.print(e.getOficina().getPoblacion()); %>',
            'cpEntrega':'<% out.print(e.getOficina().getCp()); %>',
            'calleEntrega':'<% out.print(e.getOficina().getCalle()); %>',
            'numEntrega':'<% out.print(e.getOficina().getNumero()); %>',
            'escaleraEntrega':'',
            'pisoEntrega':'',
            'puertaEntrega':''
        },
        'cliente':{
            <% if(cli != null){%>
            'provEntrega':'<% out.print(cli.getProvincia()); %>',
            'pobEntrega':'<% out.print(cli.getPoblacion()); %>',
            'cpEntrega':'<% out.print(cli.getCp()); %>',
            'calleEntrega':'<% out.print(cli.getCalle()); %>',
            'numEntrega':'<% out.print(cli.getNumero()); %>',
            'escaleraEntrega':'<% out.print(cli.getEscalera()); %>',
            'pisoEntrega':'<% out.print(cli.getPiso()); %>',
            'puertaEntrega':'<% out.print(cli.getPuerta()); %>'
        <% }else{ %>
            'provEntrega':'',
            'pobEntrega':'',
            'cpEntrega':'',
            'calleEntrega':'',
            'numEntrega':'',
            'escaleraEntrega':'',
            'pisoEntrega':'',
            'puertaEntrega':''
        <% } %>
        }
    };
</script>

<script src="js/recibo.js"></script>
<script src="js/selector.js"></script>
</body>
</html>
