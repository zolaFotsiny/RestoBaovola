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
public class DetailsCommandeView extends BDTable{
    
    int idServeur;
    
    double pourBoire;

    public double getPourBoire() {
        return pourBoire;
    }

    public void setPourBoire(double pourBoire) {
        this.pourBoire = pourBoire;
    }

    
    public int getIdServeur() {
        return idServeur;
    }

    public void setIdServeur(int idServeur) {
        this.idServeur = idServeur;
    }

    
    public List<DetailsCommandeView> getPourcentage(String date1,String date2) throws Exception{
        String req = "SELECT sum(quantite*lastPrix*pourBoire)  pourBoire,idServeur from detailsCommandeView  where dateCommande >=  '"+date1+"' and dateCommande <= '"+date2+"' group by idServeur";
        System.out.println(req);
        List plats = this.find(req, this);
        return plats;
    }
}
