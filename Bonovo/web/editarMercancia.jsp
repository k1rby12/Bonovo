<%-- 
    Document   : editarMercancia
    Created on : 12/08/2025, 10:32:52 AM
    Author     : irvin
--%>
<%@ include file="conexion.jsp" %>
<jsp:include page ="includes/header.jsp"/>
<jsp:include page ="includes/nav.jsp"/>
<%
    Connection conexion = (Connection)application.getAttribute("conexion");
    String id = request.getParameter("id");
    String nombre = "", descripcion = "";
    int cantidad = 0;
    double precio = 0.0;

    if(id != null && !id.isEmpty()) {
        PreparedStatement ps = conexion.prepareStatement("SELECT * FROM inventarios WHERE id = ?");
        ps.setInt(1, Integer.parseInt(id));
        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
            nombre = rs.getString("nombre");
            descripcion = rs.getString("descripcion");
            cantidad = rs.getInt("cantidad");
            precio = rs.getDouble("precio");
        }
        rs.close();
        ps.close();
    }
%>
<div class="container">
    <h2 class="text-center"><%= (id == null || id.isEmpty()) ? "Nueva Mercancía" : "Editar Mercancía" %></h2>
    
    <form action="guardarMercancia.jsp" method="post">
        <input type="hidden" name="id" value="<%= (id != null ? id : 0) %>" />
        
        <div class="mb-3">
            <label>Nombre:</label>
            <input type="text" name="nombre" class="form-control" value="<%= nombre %>" required />
        </div>
        
        <div class="mb-3">
            <label>Descripción:</label>
            <textarea name="descripcion" class="form-control" required><%= descripcion %></textarea>
        </div>
        
        <div class="mb-3">
            <label>Cantidad:</label>
            <input type="number" name="cantidad" class="form-control" value="<%= cantidad %>" required />
        </div>
        
        <div class="mb-3">
            <label>Precio:</label>
            <input type="number" step="0.01" name="precio" class="form-control" value="<%= precio %>" required />
        </div>
        
        <div class="container mt-3 text-center">
            <button type="submit" class="btn btn-primary">Guardar</button> 
        </div>
    </form>
    
    <div class="container mt-3 text-center"> 
        <a href="mercancias.jsp" class="btn btn-primary">Regresar</a> 
    </div>
</div>

<jsp:include page ="includes/footer.jsp"/>