<%-- 
    Document   : cliente
    Created on : 12/08/2025, 09:40:54 AM
    Author     : irvin
--%>

<%@ include file="conexion.jsp" %>
<jsp:include page ="includes/header.jsp"/>
<jsp:include page ="includes/nav.jsp"/>
<%
    Connection conexion = (Connection)application.getAttribute("conexion");
    java.sql.Statement stmt = conexion.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM clientes");
%>

<div class="container text-center">
    <h2>Clientes</h2>
    <div class="table-responsive"> <!-- Contenedor responsivo para la tabla -->
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Direcci�n</th>
                    <th>Tel�fono</th>
                    <th>Email</th>
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
                        <td><%= rs.getString("direccion") %></td>
                        <td><%= rs.getString("telefono") %></td>
                        <td><%= rs.getString("email") %></td>
                        <td>
                            <a href="editar.jsp?id=<%= rs.getInt("id") %>" class="btn btn-primary btn-sm">Editar</a>
                            <a href="eliminar.jsp?id=<%= rs.getInt("id") %>" 
                               onclick="return confirm('�Seguro que deseas eliminar este cliente?');" 
                               class="btn btn-danger btn-sm">Eliminar</a> <!-- Cambi� el color a btn-danger para eliminar -->
                        </td>
                    </tr>
                <%
                    }
                    rs.close();
                    stmt.close();
                %>
            </tbody>
        </table>
    </div>
        
    <a href="editar.jsp" class="btn btn-primary mb-3">Nuevo Cliente</a>
    <div class="container mt-3">
        <a href="index.jsp" class="btn btn-primary">Salir</a>
    </div>
</div>


<jsp:include page ="includes/footer.jsp"/>
