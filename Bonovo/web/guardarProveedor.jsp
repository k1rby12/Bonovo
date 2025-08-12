<%-- 
    Document   : guardarProveedor
    Created on : 12/08/2025, 10:09:42 AM
    Author     : irvin
--%>

<%@ include file="conexion.jsp" %>
<%
    Connection conexion = (Connection)application.getAttribute("conexion");
    String idStr = request.getParameter("id");
    String nombre = request.getParameter("nombre");
    String direccion = request.getParameter("direccion");
    String telefono = request.getParameter("telefono");
    String email = request.getParameter("email");

    if(idStr == null || idStr.equals("0") || idStr.isEmpty()) {
        PreparedStatement ps = conexion.prepareStatement("INSERT INTO proveedores(nombre, direccion, telefono, email) VALUES (?, ?, ?, ?)");
        ps.setString(1, nombre);
        ps.setString(2, direccion);
        ps.setString(3, telefono);
        ps.setString(4, email);
        ps.executeUpdate();
        ps.close();
    } else {
        int id = Integer.parseInt(idStr);
        PreparedStatement ps = conexion.prepareStatement("UPDATE proveedores SET nombre = ?, direccion = ?, telefono = ?, email = ? WHERE id = ?");
        ps.setString(1, nombre);
        ps.setString(2, direccion);
        ps.setString(3, telefono);
        ps.setString(4, email);
        ps.setInt(5, id);
        ps.executeUpdate();
        ps.close();
    }
    response.sendRedirect("proveedores.jsp");
%>
