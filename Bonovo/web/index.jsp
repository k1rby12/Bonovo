<%-- 
    Document   : index
    Created on : 11/08/2025, 07:44:21 PM
    Author     : irvin
--%>


<%@ include file="conexion.jsp" %>

<%
    String mensaje = "";
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");
        Connection conexion = (Connection) application.getAttribute("conexion");

        PreparedStatement ps = conexion.prepareStatement("SELECT * FROM usuarios WHERE usuario = ? AND password = ?");
        ps.setString(1, usuario);
        ps.setString(2, password);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            session.setAttribute("usuario", usuario);
            response.sendRedirect("cliente.jsp");
            return;
        } else {
            mensaje = "Usuario o contraseña incorrectos.";
        }
        rs.close();
        ps.close();
    }
%>


<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Bonovo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f8f9fa;
        }
        .login-container {
            background-color: white;
            padding: 2rem;
            border-radius: 0.5rem;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="login-container mx-auto" style="max-width: 400px;">
        <h3 class="mb-4 text-center">Iniciar sesión</h3>
        <% if (!mensaje.isEmpty()) { %>
            <div class="alert alert-danger"><%= mensaje %></div>
        <% } %>
        <form method="post" action="index.jsp">
            <div class="mb-3">
                <label for="usuario" class="form-label">Usuario</label>
                <input type="text" id="usuario" name="usuario" class="form-control" required autofocus />
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Contraseña</label>
                <input type="password" id="password" name="password" class="form-control" required />
            </div>
            <button type="submit" class="btn btn-primary w-100">Entrar</button>
        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
