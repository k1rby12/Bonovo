<%-- 
    Document   : guardarMercancia
    Created on : 12/08/2025, 10:33:47 AM
    Author     : irvin
--%>
<%@ include file="conexion.jsp" %>
<%
    Connection conexion = (Connection)application.getAttribute("conexion");
    String idStr = request.getParameter("id");
    String nombre = request.getParameter("nombre");
    String descripcion = request.getParameter("descripcion");
    int cantidad = Integer.parseInt(request.getParameter("cantidad"));
    double precio = Double.parseDouble(request.getParameter("precio"));

    if(idStr == null || idStr.equals("0") || idStr.isEmpty()) {
        PreparedStatement ps = conexion.prepareStatement(
            "INSERT INTO inventarios(nombre, descripcion, cantidad, precio) VALUES (?, ?, ?, ?)"
        );
        ps.setString(1, nombre);
        ps.setString(2, descripcion);
        ps.setInt(3, cantidad);
        ps.setDouble(4, precio);
        ps.executeUpdate();
        ps.close();
    } else {
        int id = Integer.parseInt(idStr);
        PreparedStatement ps = conexion.prepareStatement(
            "UPDATE inventarios SET nombre = ?, descripcion = ?, cantidad = ?, precio = ? WHERE id = ?"
        );
        ps.setString(1, nombre);
        ps.setString(2, descripcion);
        ps.setInt(3, cantidad);
        ps.setDouble(4, precio);
        ps.setInt(5, id);
        ps.executeUpdate();
        ps.close();
    }
    response.sendRedirect("mercancias.jsp");
%>