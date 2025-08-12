<%-- 
    Document   : guardarPuntoVenta
    Created on : 12/08/2025, 10:24:54 AM
    Author     : irvin
--%>
<%@ include file="conexion.jsp" %>
<%
    Connection conexion = (Connection)application.getAttribute("conexion");
    String idStr = request.getParameter("id");
    String producto = request.getParameter("producto");
    int cantidad = Integer.parseInt(request.getParameter("cantidad"));
    double precioUnitario = Double.parseDouble(request.getParameter("precio_unitario"));
    String fechaVentaStr = request.getParameter("fecha_venta");
    java.sql.Date fechaVenta = java.sql.Date.valueOf(fechaVentaStr);
    double total = cantidad * precioUnitario;

    if(idStr == null || idStr.equals("0") || idStr.isEmpty()) {
        PreparedStatement ps = conexion.prepareStatement(
            "INSERT INTO punto_venta(producto, cantidad, precio_unitario, total, fecha_venta) VALUES (?, ?, ?, ?, ?)"
        );
        ps.setString(1, producto);
        ps.setInt(2, cantidad);
        ps.setDouble(3, precioUnitario);
        ps.setDouble(4, total);
        ps.setDate(5, fechaVenta);
        ps.executeUpdate();
        ps.close();
    } else {
        int id = Integer.parseInt(idStr);
        PreparedStatement ps = conexion.prepareStatement(
            "UPDATE punto_venta SET producto = ?, cantidad = ?, precio_unitario = ?, total = ?, fecha_venta = ? WHERE id = ?"
        );
        ps.setString(1, producto);
        ps.setInt(2, cantidad);
        ps.setDouble(3, precioUnitario);
        ps.setDouble(4, total);
        ps.setDate(5, fechaVenta);
        ps.setInt(6, id);
        ps.executeUpdate();
        ps.close();
    }
    response.sendRedirect("puntoVenta.jsp");
%>