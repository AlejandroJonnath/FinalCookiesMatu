package org.elvis.webbappcookiematu.services;

import org.elvis.webbappcookiematu.models.Articulo;
import org.elvis.webbappcookiematu.repository.ArticuloRepositoryJdbcImplment;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class ArticuloServiceJdbcImplement implements ArticuloService {
    private ArticuloRepositoryJdbcImplment repositorio;

    public ArticuloServiceJdbcImplement(Connection connection) {
        this.repositorio = new ArticuloRepositoryJdbcImplment(connection);
    }

    @Override
    public List<Articulo> listar() {
        try {
            return repositorio.listar();
        } catch (SQLException e) {
            throw new ServiceJdbcException(e.getMessage(), e.getCause());
        }
    }

    @Override
    public Articulo porId(Long id) {
        try {
            return repositorio.porId(id);
        } catch (SQLException e) {
            throw new ServiceJdbcException(e.getMessage(), e.getCause());
        }
    }

    @Override
    public void guardar(Articulo articulo) {
        try {
            repositorio.guardar(articulo);
        } catch (SQLException e) {
            throw new ServiceJdbcException(e.getMessage(), e.getCause());
        }
    }

    @Override
    public void eliminar(Long id) {
        try {
            repositorio.eliminar(id);
        } catch (SQLException e) {
            throw new ServiceJdbcException(e.getMessage(), e.getCause());
        }
    }
}