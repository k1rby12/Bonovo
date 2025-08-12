<%-- 
    Document   : eliminarNomina
    Created on : 12/08/2025, 10:11:52 AM
    Author     : irvin
--%>

<%@ include file="conexion.jsp" %>
<%
    Connection conexion = (Connection)application.getAttribute("conexion");
    String id = request.getParameter("id");
    if(id != null && !id.isEmpty()) {
        PreparedStatement ps = conexion.prepareStatement("DELETE FROM nomina WHERE id = ?");
        ps.setInt(1, Integer.parseInt(id));
        ps.executeUpdate();
        ps.close();
    }
    response.sendRedirect("nomina.jsp");
%>