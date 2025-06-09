package org.elvis.webbappcookiematu.services;

import org.elvis.webbappcookiematu.models.Articulo;

import java.util.List;

public interface ArticuloService {
    List<Articulo> listar();
    Articulo porId(Long id);
    void guardar(Articulo articulo);
    void eliminar(Long id);
}