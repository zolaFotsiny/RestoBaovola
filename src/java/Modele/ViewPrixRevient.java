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
public class ViewPrixRevient extends BDTable{
    int idProduit;
    String nom;
    int idCategorie;
    String photo;
    double lastPrix;
    double prixTotalIngredient;
    double prixRevient;

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

    public double getLastPrix() {
        return lastPrix;
    }

    public void setLastPrix(double lastPrix) {
        this.lastPrix = lastPrix;
    }

    public double getPrixTotalIngredient() {
        return prixTotalIngredient;
    }

    public void setPrixTotalIngredient(double prixTotalIngredient) {
        this.prixTotalIngredient = prixTotalIngredient;
    }

    public double getPrixRevient() {
        return prixRevient;
    }

    public void setPrixRevient(double prixRevient) {
        this.prixRevient = prixRevient;
    }
    
    public List totalPrixRevient(int idProduit) throws Exception{
        String req = "select * from viewPrixRevient where idProduit = "+idProduit;
        List plats = this.find(req, this);
        return plats;
    }
    
     public static void main(String[] args) throws Exception{
       ViewPrixRevient d = new ViewPrixRevient();
       List <ViewPrixRevient> list = d.totalPrixRevient(1);
       System.out.println(list);
    }
}












































































