<%-- 
    Document   : editarNomina
    Created on : 12/08/2025, 10:11:28 AM
    Author     : irvin
--%>

<%@ include file="conexion.jsp" %>
<jsp:include page ="includes/header.jsp"/>
<jsp:include page ="includes/nav.jsp"/>
<%
    Connection conexion = (Connection)application.getAttribute("conexion");
    String id = request.getParameter("id");
    String empleado = "", puesto = "";
    double salarioBase = 0, bonos = 0, deducciones = 0;

    if(id != null && !id.isEmpty()) {
        PreparedStatement ps = conexion.prepareStatement("SELECT * FROM nomina WHERE id = ?");
        ps.setInt(1, Integer.parseInt(id));
        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
            empleado = rs.getString("empleado");
            puesto = rs.getString("puesto");
            salarioBase = rs.getDouble("salario_base");
            bonos = rs.getDouble("bonos");
            deducciones = rs.getDouble("deducciones");
        }
        rs.close();
        ps.close();
    }
%>
<div class="container mt-4">
    <h2><%= (id != null && !id.isEmpty()) ? "Editar Nómina" : "Nuevo Registro" %></h2>
    <form action="guardarNomina.jsp" method="post">
        <input type="hidden" name="id" value="<%= (id != null ? id : 0) %>">
        <div class="mb-3">
            <label>Empleado:</label>
            <input type="text" name="empleado" value="<%= empleado %>" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Puesto:</label>
            <input type="text" name="puesto" value="<%= puesto %>" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Salario Base:</label>
            <input type="number" step="0.01" name="salario_base" value="<%= salarioBase %>" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Bonos:</label>
            <input type="number" step="0.01" name="bonos" value="<%= bonos %>" class="form-control">
        </div>
        <div class="mb-3">
            <label>Deducciones:</label>
            <input type="number" step="0.01" name="deducciones" value="<%= deducciones %>" class="form-control">
        </div>
        <button type="submit" class="btn btn-primary">Guardar</button>
    </form>
        <div class="container mt-3">
    <a href="nomina.jsp" class="btn btn-primary">Regresar</a>
</div>
</div>

<jsp:include page ="includes/footer.jsp"/>
