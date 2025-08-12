<%-- 
    Document   : eliminar
    Created on : 11/08/2025, 09:11:16 PM
    Author     : irvin
--%>

<%@ include file="conexion.jsp" %>
<%
    Connection conexion = (Connection)application.getAttribute("conexion");
    String idStr = request.getParameter("id");
    if(idStr != null) {
        int id = Integer.parseInt(idStr);
        PreparedStatement ps = conexion.prepareStatement("DELETE FROM clientes WHERE id = ?");
        ps.setInt(1, id);
        ps.executeUpdate();
        ps.close();
    }
    response.sendRedirect("cliente.jsp");
%>
