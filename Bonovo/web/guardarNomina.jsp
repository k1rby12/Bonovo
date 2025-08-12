<%-- 
    Document   : guardarNomina
    Created on : 12/08/2025, 10:12:08 AM
    Author     : irvin
--%>

<%@ include file="conexion.jsp" %>
<%
    Connection conexion = (Connection)application.getAttribute("conexion");
    String idStr = request.getParameter("id");
    String empleado = request.getParameter("empleado");
    String puesto = request.getParameter("puesto");
    double salarioBase = Double.parseDouble(request.getParameter("salario_base"));
    double bonos = Double.parseDouble(request.getParameter("bonos"));
    double deducciones = Double.parseDouble(request.getParameter("deducciones"));
    double totalPagar = salarioBase + bonos - deducciones;

    if(idStr == null || idStr.equals("0") || idStr.isEmpty()) {
        PreparedStatement ps = conexion.prepareStatement(
            "INSERT INTO nomina(empleado, puesto, salario_base, bonos, deducciones, total_pagar) VALUES (?, ?, ?, ?, ?, ?)"
        );
        ps.setString(1, empleado);
        ps.setString(2, puesto);
        ps.setDouble(3, salarioBase);
        ps.setDouble(4, bonos);
        ps.setDouble(5, deducciones);
        ps.setDouble(6, totalPagar);
        ps.executeUpdate();
        ps.close();
    } else {
        int id = Integer.parseInt(idStr);
        PreparedStatement ps = conexion.prepareStatement(
            "UPDATE nomina SET empleado = ?, puesto = ?, salario_base = ?, bonos = ?, deducciones = ?, total_pagar = ? WHERE id = ?"
        );
        ps.setString(1, empleado);
        ps.setString(2, puesto);
        ps.setDouble(3, salarioBase);
        ps.setDouble(4, bonos);
        ps.setDouble(5, deducciones);
        ps.setDouble(6, totalPagar);
        ps.setInt(7, id);
        ps.executeUpdate();
        ps.close();
    }
    response.sendRedirect("nomina.jsp");
%>