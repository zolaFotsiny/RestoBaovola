/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modele;

import java.util.List;

/**
 *
 * @author Tommy.Z
 */
public class Categorie extends DB.BDTable{
    int idCategorie;
    String nom;

    public int getIdCategorie() {
        return idCategorie;
    }

    public void setIdCategorie(int idCategorie) {
        this.idCategorie = idCategorie;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }
    
    public List getAllCategorie() throws Exception
    {
        String requete = "SELECT * FROM categorie";
        List plats = this.find(requete, this);
        return plats;
    }
}
