<%-- 
    Document   : puntoVenta
    Created on : 11/08/2025, 08:14:05 PM
    Author     : irvin
--%>
<%@ include file="conexion.jsp" %>
<jsp:include page ="includes/header.jsp"/>
<jsp:include page ="includes/nav.jsp"/>
<%
    Connection conexion = (Connection)application.getAttribute("conexion");
    Statement stmt = conexion.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM punto_venta");
%>

<div class="container text-center">
    <h2>Punto de Venta</h2>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>Producto</th>
                <th>Cantidad</th>
                <th>Precio Unitario</th>
                <th>Total</th>
                <th>Fecha Venta</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <%
                while (rs.next()) {
            %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("producto") %></td>
                    <td><%= rs.getInt("cantidad") %></td>
                    <td><%= rs.getDouble("precio_unitario") %></td>
                    <td><%= rs.getDouble("total") %></td>
                    <td><%= rs.getDate("fecha_venta") %></td>
                    <td>
                        <a href="editar_pv.jsp?id=<%= rs.getInt("id") %>" class="btn btn-primary btn-sm">Editar</a>
                        <a href="eliminar_pv.jsp?id=<%= rs.getInt("id") %>" 
                           onclick="return confirm('¿Seguro que deseas eliminar este registro?');" 
                           class="btn btn-danger btn-sm">Eliminar</a>
                    </td>
                </tr>
            <%
                }
                rs.close();
                stmt.close();
            %>
        </tbody>
    </table>
        <a href="editar_pv.jsp" class="btn btn-primary mb-3">Nuevo Registro</a>
        <div class="container mt-3">
    <a href="index.jsp" class="btn btn-primary">Salir</a>
</div>
</div>


<jsp:include page ="includes/footer.jsp"/>
