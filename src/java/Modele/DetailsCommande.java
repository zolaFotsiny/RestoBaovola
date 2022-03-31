/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modele;

import DB.BDTable;

/**
 *
 * @author Mahandry
 */
public class DetailsCommande extends BDTable{
    int idDetailsCommande;
    int idProduit;
    int idCommande;
    int quantite;

    public int getIdDetailsCommande() {
        return idDetailsCommande;
    }

    public void setIdDetailsCommande(int idDetailsCommande) {
        this.idDetailsCommande = idDetailsCommande;
    }

    public int getIdProduit() {
        return idProduit;
    }

    public void setIdProduit(int idProduit) {
        this.idProduit = idProduit;
    }

    public int getIdCommande() {
        return idCommande;
    }

    public void setIdCommande(int idCommande) {
        this.idCommande = idCommande;
    }

    public int getQuantite() {
        return quantite;
    }

    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }
    
    public void insererDetailsCommande(String idProduit, String idCommande) throws Exception{
        String req = "insert into detailsCommande(idProduit,idCommande,quantite) values ("+idProduit+","+idCommande+",1)";
        System.out.println(req);
        this.execute(req);
    }
}
