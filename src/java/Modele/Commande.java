/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modele;

import DB.BDTable;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author Mahandry
 */
public class Commande extends BDTable{
    int idCommande;
    Date dateCommande;
    int idServeur;

    public int getIdCommande() {
        return idCommande;
    }

    public void setIdCommande(int idCommande) {
        this.idCommande = idCommande;
    }

    public Date getDateCommande() {
        return dateCommande;
    }

    public void setDateCommande(Date dateCommande) {
        this.dateCommande = dateCommande;
    }

    public int getIdServeur() {
        return idServeur;
    }

    public void setIdServeur(int idServeur) {
        this.idServeur = idServeur;
    }
    
    public List listCommande() throws Exception{
        String requete = "SELECT * FROM commande";
        List plats = this.find(requete, this);
        return plats;
    }
    
    public void generateCommande(String nomTable, String date) throws Exception{
        String req = "insert into commande (idTable, dateCommande) values ("+nomTable+",'"+date+"')";
        this.execute(req);
    }
    
    public String maxCommande() throws Exception{
        return this.selectString("select max(idCommande) from commande");
    }
    
    
}
