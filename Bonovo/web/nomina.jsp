<%-- 
    Document   : nomina
    Created on : 11/08/2025, 08:13:17 PM
    Author     : irvin
--%>

<%@ include file="conexion.jsp" %>
<jsp:include page ="includes/header.jsp"/>
<jsp:include page ="includes/nav.jsp"/>
<%
    Connection conexion = (Connection)application.getAttribute("conexion");
    Statement stmt = conexion.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM nomina");
%>

<div class="container px-0 px-sm-3">
    <h2 class="mb-4 text-center">Nómina</h2>
    <div class="table-responsive" style="overflow-x: auto; -webkit-overflow-scrolling: touch;">
        <table class="table table-striped table-bordered table-hover mb-4" style="min-width: 1000px;">
            <thead class="thead-dark">
                <tr>
                    <th style="min-width: 50px;">ID</th>
                    <th style="min-width: 120px;">Empleado</th>
                    <th style="min-width: 120px;">Puesto</th>
                    <th style="min-width: 100px;">Salario Base</th>
                    <th style="min-width: 100px;">Bonos</th>
                    <th style="min-width: 100px;">Deducciones</th>
                    <th style="min-width: 100px;">Total a Pagar</th>
                    <th style="min-width: 130px;">Acciones</th>
                </tr>
            </thead>
            <tbody>
                <% while (rs.next()) { %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td class="text-truncate"><%= rs.getString("empleado") %></td>
                    <td class="text-truncate"><%= rs.getString("puesto") %></td>
                    <td>$<%= String.format("%.2f", rs.getDouble("salario_base")) %></td>
                    <td>$<%= String.format("%.2f", rs.getDouble("bonos")) %></td>
                    <td>$<%= String.format("%.2f", rs.getDouble("deducciones")) %></td>
                    <td>$<%= String.format("%.2f", rs.getDouble("total_pagar")) %></td>
                    <td>
                        <div class="d-flex flex-nowrap gap-2">
                            <a href="editarNomina.jsp?id=<%= rs.getInt("id") %>" class="btn btn-primary btn-sm px-3">
                                <i class="fas fa-edit"></i> Editar
                            </a>
                            <a href="eliminarNomina.jsp?id=<%= rs.getInt("id") %>" 
                               onclick="return confirm('¿Seguro que deseas eliminar este registro?');" 
                               class="btn btn-primary btn-sm px-3">
                                <i class="fas fa-trash-alt"></i> Eliminar
                            </a>
                        </div>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
    
    <div class="d-flex flex-column flex-sm-row justify-content-between align-items-center">
        <a href="editarNomina.jsp" class="btn btn-primary mb-3 mb-sm-0" style="min-width: 140px;">
            <i class="fas fa-plus"></i> Nuevo Registro
        </a>
        <a href="index.jsp" class="btn btn-primary" style="min-width: 100px;">
            <i class="fas fa-sign-out-alt"></i> Salir
        </a>
    </div>
</div>

<jsp:include page ="includes/footer.jsp"/>
