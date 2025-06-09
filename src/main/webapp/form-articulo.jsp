<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.elvis.webbappcookiematu.models.Articulo" %>
<%@ page import="org.elvis.webbappcookiematu.models.Categoria" %>
<%@ page import="java.util.*" %>
<html>
<head>
  <title>${titulo}</title>
  <style>
    .error-message {
      color: red;
      font-size: 12px;
      margin: 5px 0;
    }
  </style>
</head>
<body>
<h1>${titulo}</h1>
<form action="<%=request.getContextPath()%>/articulos/form" method="post">
  <div>
    <label for="categoria">Categoría</label>
    <select name="categoria" id="categoria">
      <option value="">Seleccione una categoría</option>
      <%
        List<Categoria> categorias = (List<Categoria>) request.getAttribute("categorias");
        Articulo articulo = (Articulo) request.getAttribute("articulo");
        Map<String, String> errores = (Map<String, String>) request.getAttribute("errores");
        if (categorias != null) {
          for (Categoria c : categorias) {
            String selected = "";
            if (articulo != null && articulo.getCategoria() != null &&
                    c.getIdCategoria().equals(articulo.getCategoria().getIdCategoria())) {
              selected = "selected";
            }
      %>
      <option value="<%= c.getIdCategoria() %>" <%= selected %>><%= c.getNombre() %></option>
      <%
          }
        }
      %>
    </select>
    <% if (errores != null && errores.get("categoria") != null) { %>
    <div class="error-message"><%= errores.get("categoria") %></div>
    <% } %>
  </div>
  <div>
    <label for="codigo">Código</label>
    <input type="text" name="codigo" id="codigo"
           value="<%= articulo != null ? articulo.getCodigo() : "" %>">
    <% if (errores != null && errores.get("codigo") != null) { %>
    <div class="error-message"><%= errores.get("codigo") %></div>
    <% } %>
  </div>
  <div>
    <label for="nombre">Nombre</label>
    <input type="text" name="nombre" id="nombre"
           value="<%= articulo != null ? articulo.getNombre() : "" %>">
    <% if (errores != null && errores.get("nombre") != null) { %>
    <div class="error-message"><%= errores.get("nombre") %></div>
    <% } %>
  </div>
  <div>
    <label for="stock">Stock</label>
    <input type="number" name="stock" id="stock"
           value="<%= articulo != null ? articulo.getStock() : "" %>">
    <% if (errores != null && errores.get("stock") != null) { %>
    <div class="error-message"><%= errores.get("stock") %></div>
    <% } %>
  </div>
  <div>
    <label for="descripcion">Descripción</label>
    <textarea name="descripcion" id="descripcion"><%= articulo != null ? articulo.getDescripcion() : "" %></textarea>
  </div>
  <div>
    <label for="imagen">Imagen</label>
    <input type="text" name="imagen" id="imagen"
           value="<%= articulo != null ? articulo.getImagen() : "" %>">
  </div>
  <div>
    <label for="condicion">Condición</label>
    <input type="number" name="condicion" id="condicion"
           value="<%= articulo != null ? articulo.getCondicion() : "" %>">
    <% if (errores != null && errores.get("condicion") != null) { %>
    <div class="error-message"><%= errores.get("condicion") %></div>
    <% } %>
  </div>

  <% if (articulo != null && articulo.getIdArticulo() != null) { %>
  <input type="hidden" name="id" value="<%= articulo.getIdArticulo() %>">
  <% } %>
  <button type="submit">Guardar</button>
</form>
<a href="<%=request.getContextPath()%>/articulos">Volver</a>
</body>
</html>