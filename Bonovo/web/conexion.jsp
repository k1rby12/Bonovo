<%-- 
    Document   : conexion
    Created on : 11/08/2025, 07:52:22 PM
    Author     : irvin
--%>

<%@ page import="java.sql.*" %>
<%
    if (application.getAttribute("conexion") == null) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/bonovo", "root", ""); 
            application.setAttribute("conexion", conexion);
        } catch (Exception e) {
            out.println("Error de conexión: " + e.getMessage());
        }
    }
%>
