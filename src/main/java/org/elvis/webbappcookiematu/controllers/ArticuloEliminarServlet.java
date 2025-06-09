package org.elvis.webbappcookiematu.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.elvis.webbappcookiematu.services.ArticuloService;
import org.elvis.webbappcookiematu.services.ArticuloServiceJdbcImplement;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/articulos/eliminar")
public class ArticuloEliminarServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = (Connection) req.getAttribute("conn");
        ArticuloService service = new ArticuloServiceJdbcImplement(conn);

        String idStr = req.getParameter("id");
        if (idStr != null && !idStr.isEmpty()) {
            try {
                Long id = Long.parseLong(idStr);
                service.eliminar(id);
            } catch (NumberFormatException e) {
                // Manejar error si el ID no es válido
            }
        }
        resp.sendRedirect(req.getContextPath() + "/articulos");
    }
}