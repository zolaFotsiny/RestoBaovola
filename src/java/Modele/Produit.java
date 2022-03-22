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
public class Produit extends DB.BDTable{
    int idProduit;
    String nom;
    int idCategorie;
    String photo;
    double lastprix;

    public double getLastprix() {
        return lastprix;
    }

    public void setLastprix(double lastprix) {
        this.lastprix = lastprix;
    }

    public int getIdProduit() {
        return idProduit;
    }

    public void setIdProduit(int idProduit) {
        this.idProduit = idProduit;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public int getIdCategorie() {
        return idCategorie;
    }

    public void setIdCategorie(int idCategorie) {
        this.idCategorie = idCategorie;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }
    
    public List listPlat() throws Exception
    {
        String requete = "SELECT * FROM produit";
        List plats = this.find(requete, this);
        return plats;
    }
    
    public List listPlat(int idCat) throws Exception
    {
        String requete = "SELECT * FROM produit WHERE idCategorie = "+idCat;
        List plats = this.find(requete, this);
        return plats;
    }
}
