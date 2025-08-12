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

<div class="container text-center">
    <h2>Nómina</h2>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>Empleado</th>
                <th>Puesto</th>
                <th>Salario Base</th>
                <th>Bonos</th>
                <th>Deducciones</th>
                <th>Total a Pagar</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <%
                while (rs.next()) {
            %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("empleado") %></td>
                    <td><%= rs.getString("puesto") %></td>
                    <td><%= rs.getDouble("salario_base") %></td>
                    <td><%= rs.getDouble("bonos") %></td>
                    <td><%= rs.getDouble("deducciones") %></td>
                    <td><%= rs.getDouble("total_pagar") %></td>
                    <td>
                        <a href="editarNomina.jsp?id=<%= rs.getInt("id") %>" class="btn btn-primary btn-sm">Editar</a>
                        <a href="eliminarNomina.jsp?id=<%= rs.getInt("id") %>" 
                           onclick="return confirm('¿Seguro que deseas eliminar este registro?');" 
                           class="btn btn-primary btn-sm">Eliminar</a>
                    </td>
                </tr>
            <%
                }
                rs.close();
                stmt.close();
            %>
        </tbody>
    </table>
        <a href="editarNomina.jsp" class="btn btn-primary mb-3">Nuevo Registro</a>
        <div class="container mt-3">
    <a href="index.jsp" class="btn btn-primary">Salir</a>
</div>
</div>

<jsp:include page ="includes/footer.jsp"/>
