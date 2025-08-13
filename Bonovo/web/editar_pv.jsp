<%-- 
    Document   : editar_pv
    Created on : 12/08/2025, 10:22:41 AM
    Author     : irvin
--%>

<%@ include file="conexion.jsp" %>
<jsp:include page ="includes/header.jsp"/>
<jsp:include page ="includes/nav.jsp"/>
<%
    Connection conexion = (Connection)application.getAttribute("conexion");
    String id = request.getParameter("id");
    String producto = "";
    int cantidad = 0;
    double precioUnitario = 0;
    double total = 0;
    java.sql.Date fechaVenta = null;

    if(id != null && !id.isEmpty()) {
        PreparedStatement ps = conexion.prepareStatement("SELECT * FROM punto_venta WHERE id = ?");
        ps.setInt(1, Integer.parseInt(id));
        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
            producto = rs.getString("producto");
            cantidad = rs.getInt("cantidad");
            precioUnitario = rs.getDouble("precio_unitario");
            total = rs.getDouble("total");
            fechaVenta = rs.getDate("fecha_venta");
        }
        rs.close();
        ps.close();
    }
%>
<div class="container">
    <h2 class="text-center"><%= (id == null || id.isEmpty()) ? "Nuevo Registro Punto de Venta" : "Editar Registro Punto de Venta" %></h2>
    <br>
    <form action="guardarPuntoVenta.jsp" method="post">
        <input type="hidden" name="id" value="<%= (id != null ? id : 0) %>" />
        
        <div class="mb-3">
            <label>Producto:</label>
            <input type="text" name="producto" class="form-control" value="<%= producto %>" required />
        </div>
        
        <div class="mb-3">
            <label>Cantidad:</label>
            <input type="number" name="cantidad" class="form-control" value="<%= cantidad %>" required />
        </div>
        
        <div class="mb-3">
            <label>Precio Unitario:</label>
            <input type="number" step="0.01" name="precio_unitario" class="form-control" value="<%= precioUnitario %>" required />
        </div>
        
        <div class="mb-3">
            <label>Fecha de Venta:</label>
            <input type="date" name="fecha_venta" class="form-control" value="<%= (fechaVenta != null ? fechaVenta.toString() : "") %>" required />
        </div>
        
        <div class="container mt-3 text-center">
            <button type="submit" class="btn btn-primary">Guardar</button> 
        </div>
    </form>
    
    <div class="container mt-3 text-center"> 
        <a href="puntoVenta.jsp" class="btn btn-primary">Regresar</a> 
    </div>
</div>

<jsp:include page ="includes/footer.jsp"/>
