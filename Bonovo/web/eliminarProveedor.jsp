<%-- 
    Document   : eliminarProveedor
    Created on : 12/08/2025, 10:08:02 AM
    Author     : irvin
--%>

<%@ include file="conexion.jsp" %>
<%
    Connection conexion = (Connection)application.getAttribute("conexion");
    String id = request.getParameter("id");
    if(id != null && !id.isEmpty()) {
        PreparedStatement ps = conexion.prepareStatement("DELETE FROM proveedores WHERE id = ?");
        ps.setInt(1, Integer.parseInt(id));
        ps.executeUpdate();
        ps.close();
    }
    response.sendRedirect("proveedores.jsp");
%>
