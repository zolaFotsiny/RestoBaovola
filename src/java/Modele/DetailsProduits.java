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
public class DetailsProduits extends BDTable{
    int idDetailsProduits;
    int idProduit;
    int idIngredient;
    
    double quantite;

    public int getIdDetailsProduits() {
        return idDetailsProduits;
    }

    public void setIdDetailsProduits(int idDetailsProduits) {
        this.idDetailsProduits = idDetailsProduits;
    }

    public int getIdProduit() {
        return idProduit;
    }

    public void setIdProduit(int idProduit) {
        this.idProduit = idProduit;
    }

    public int getIdIngredient() {
        return idIngredient;
    }

    public void setIdIngredient(int idIngredient) {
        this.idIngredient = idIngredient;
    }

    public double getQuantite() {
        return quantite;
    }

    public void setQuantite(double quantite) {
        this.quantite = quantite;
    }
    
    public List detailProduits(int idProduit) throws Exception
    {
        String rq = "SELECT * FROM detailsProduit WHERE idProduit = "+idProduit;
        List produit = this.find(rq, this);
        return produit;
    }
}
