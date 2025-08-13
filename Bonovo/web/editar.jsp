<%-- 
    Document   : editar.jsp
    Created on : 11/08/2025, 09:07:00 PM
    Author     : irvin
--%>
<%@ include file="conexion.jsp" %>
<jsp:include page ="includes/header.jsp"/>
<jsp:include page ="includes/nav.jsp"/>
<%
    Connection conexion = (Connection)application.getAttribute("conexion");
    String idStr = request.getParameter("id");
    String nombre = "", direccion = "", telefono = "", email = "";
    int id = 0;

    if(idStr != null) {
        id = Integer.parseInt(idStr);
        PreparedStatement ps = conexion.prepareStatement("SELECT * FROM clientes WHERE id = ?");
        ps.setInt(1, id);
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
<br>
<div class="container">
    <h2 class="text-center"><%= (id == 0) ? "Nuevo Cliente" : "Editar Cliente" %></h2>
    
    <form action="guardar.jsp" method="post">
        <input type="hidden" name="id" value="<%= id %>" />
        
        <div class="mb-3">
            <label>Nombre:</label>
            <input type="text" name="nombre" class="form-control" value="<%= nombre %>" required />
        </div>
        
        <div class="mb-3">
            <label>Dirección:</label>
            <input type="text" name="direccion" class="form-control" value="<%= direccion %>" required />
        </div>
        
        <div class="mb-3">
            <label>Teléfono:</label>
            <input type="text" name="telefono" class="form-control" value="<%= telefono %>" required />
        </div>
        
        <div class="mb-3">
            <label>Email:</label>
            <input type="email" name="email" class="form-control" value="<%= email %>" required />
        </div>
        
        <div class="container mt-3 text-center">
            <button type="submit" class="btn btn-primary">Guardar</button> 
        </div>
    </form>
    
    <div class="container mt-3 text-center"> 
        <a href="cliente.jsp" class="btn btn-primary">Regresar</a> 
    </div>
</div>
<jsp:include page ="includes/footer.jsp"/>