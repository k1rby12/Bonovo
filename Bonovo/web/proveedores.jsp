<%-- 
    Document   : proveedores
    Created on : 11/08/2025, 08:10:50 PM
    Author     : irvin
--%>

<%@ include file="conexion.jsp" %>
<jsp:include page ="includes/header.jsp"/>
<jsp:include page ="includes/nav.jsp"/>
<%
    Connection conexion = (Connection)application.getAttribute("conexion");
    java.sql.Statement stmt = conexion.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM proveedores");
%>

<div class="container text-center">
    <h2>Proveedores</h2>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>ID</th><th>Nombre</th><th>Dirección</th><th>Teléfono</th><th>Email</th><th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <%
                while (rs.next()) {
            %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("nombre") %></td>
                    <td><%= rs.getString("direccion") %></td>
                    <td><%= rs.getString("telefono") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td>
                        <a href="editarProveedor.jsp?id=<%= rs.getInt("id") %>" class="btn btn-primary btn-sm">Editar</a>
                        <a href="eliminarProveedor.jsp?id=<%= rs.getInt("id") %>" 
                           onclick="return confirm('¿Seguro que deseas eliminar este proveedor?');" 
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
    <a href="editarProveedor.jsp" class="btn btn-primary mb-3">Nuevo Proveedor</a>
    <div class="container mt-3">
    <a href="index.jsp" class="btn btn-primary">Salir</a>
</div>
</div>

<jsp:include page ="includes/footer.jsp"/>
