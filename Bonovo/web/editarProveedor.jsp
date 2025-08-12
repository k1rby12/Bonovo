<%-- 
    Document   : editarProveedor
    Created on : 12/08/2025, 10:07:20 AM
    Author     : irvin
--%>

<%@ include file="conexion.jsp" %>
<jsp:include page ="includes/header.jsp"/>
<jsp:include page ="includes/nav.jsp"/>
<%
    Connection conexion = (Connection)application.getAttribute("conexion");
    String id = request.getParameter("id");
    String nombre = "", direccion = "", telefono = "", email = "";
    
    if(id != null && !id.isEmpty()) {
        PreparedStatement ps = conexion.prepareStatement("SELECT * FROM proveedores WHERE id = ?");
        ps.setInt(1, Integer.parseInt(id));
        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
            nombre = rs.getString("nombre");
            direccion = rs.getString("direccion");
            telefono = rs.getString("telefono");
            email = rs.getString("email");
        }
        rs.close();
        ps.close();
    }
%>
<form action="guardarProveedor.jsp" method="post" class="container mt-4">
    <input type="hidden" name="id" value="<%= (id != null ? id : 0) %>">
    <div class="mb-3">
        <label>Nombre:</label>
        <input type="text" name="nombre" value="<%= nombre %>" class="form-control" required>
    </div>
    <div class="mb-3">
        <label>Dirección:</label>
        <input type="text" name="direccion" value="<%= direccion %>" class="form-control" required>
    </div>
    <div class="mb-3">
        <label>Teléfono:</label>
        <input type="text" name="telefono" value="<%= telefono %>" class="form-control">
    </div>
    <div class="mb-3">
        <label>Email:</label>
        <input type="email" name="email" value="<%= email %>" class="form-control">
    </div>
    <button type="submit" class="btn btn-primary">Guardar</button>
</form>
        <div class="container mt-3">
    <a href="proveedores.jsp" class="btn btn-primary">Regresar</a>
</div>
<jsp:include page ="includes/footer.jsp"/>
