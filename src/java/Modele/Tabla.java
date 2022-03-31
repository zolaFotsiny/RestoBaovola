/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modele;

import DB.BDTable;
import java.util.List;

/**
 *
 * @author Mahandry
 */
public class Tabla extends BDTable{
    int id;
    String nom;
    int statut;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public int getStatut() {
        return statut;
    }

    public void setStatut(int statut) {
        this.statut = statut;
    }
    
    public List<Tabla> getAllTable() throws Exception{
        String req = "select *from tabla";
        List<Tabla> t = this.find(req, this);
        return t;
    }
}
