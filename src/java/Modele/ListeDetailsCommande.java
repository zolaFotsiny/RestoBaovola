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
public class ListeDetailsCommande extends BDTable{
    int idCommande;
    String dateCommande;
    int idTable;
    String nom;
    double lastprix;
    int quantite;

    public ListeDetailsCommande(){
    }
    
    

    public ListeDetailsCommande(int idCommande, String dateCommande, int idTable, String nom, double lastprix, int quantite) {
        this.idCommande = idCommande;
        this.dateCommande = dateCommande;
        this.idTable = idTable;
        this.nom = nom;
        this.lastprix = lastprix;
        this.quantite = quantite;
    }
    
    

    public int getIdCommande() {
        return idCommande;
    }

    public void setIdCommande(int idCommande) {
        this.idCommande = idCommande;
    }

    public String getDateCommande() {
        return dateCommande;
    }

    public void setDateCommande(String dateCommande) {
        this.dateCommande = dateCommande;
    }

    public int getIdTable() {
        return idTable;
    }

    public void setIdTable(int idTable) {
        this.idTable = idTable;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public double getLastprix() {
        return lastprix;
    }

    public void setLastprix(double lastprix) {
        this.lastprix = lastprix;
    }

    public int getQuantite() {
        return quantite;
    }

    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }
    
    public List<ListeDetailsCommande> getListeDetails(String idCommande) throws Exception{
        String req = "SELECT * FROM ListeDetailsCommande WHERE idCommande="+idCommande;
        System.out.println(req);
        List<ListeDetailsCommande> liste = this.find(req, this);
        return liste;
    }
}
