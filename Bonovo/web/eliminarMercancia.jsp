<%-- 
    Document   : eliminarMercancia
    Created on : 12/08/2025, 10:34:25 AM
    Author     : irvin
--%>
<%@ include file="conexion.jsp" %>
<%
    Connection conexion = (Connection)application.getAttribute("conexion");
    String id = request.getParameter("id");
    if(id != null && !id.isEmpty()) {
        PreparedStatement ps = conexion.prepareStatement("DELETE FROM inventarios WHERE id = ?");
        ps.setInt(1, Integer.parseInt(id));
        ps.executeUpdate();
        ps.close();
    }
    response.sendRedirect("mercancias.jsp");
%>
