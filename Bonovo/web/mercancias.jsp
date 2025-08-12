<%-- 
    Document   : mercancias
    Created on : 11/08/2025, 08:12:01 PM
    Author     : irvin
--%>



<%@ include file="conexion.jsp" %>
<jsp:include page ="includes/header.jsp"/>
<jsp:include page ="includes/nav.jsp"/>
<%
    Connection conexion = (Connection)application.getAttribute("conexion");
    Statement stmt = conexion.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM inventarios");
%>

<div class="container text-center">
    <h2>Mercancías</h2>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Descripción</th>
                <th>Cantidad</th>
                <th>Precio</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <%
                while (rs.next()) {
            %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("nombre") %></td>
                    <td><%= rs.getString("descripcion") %></td>
                    <td><%= rs.getInt("cantidad") %></td>
                    <td><%= rs.getDouble("precio") %></td>
                    <td>
                        <a href="editarMercancia.jsp?id=<%= rs.getInt("id") %>" class="btn btn-primary btn-sm">Editar</a>
                        <a href="eliminarMercancia.jsp?id=<%= rs.getInt("id") %>" 
                           onclick="return confirm('¿Seguro que deseas eliminar esta mercancía?');" 
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
        <a href="editarMercancia.jsp" class="btn btn-primary mb-3">Nueva Mercancía</a>
        <div class="container mt-3">
    <a href="index.jsp" class="btn btn-primary">Salir</a>
</div>
</div>

<jsp:include page ="includes/footer.jsp"/>
