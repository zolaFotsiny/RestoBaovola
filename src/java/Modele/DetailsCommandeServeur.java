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
public class DetailsCommandeServeur extends BDTable{
    int idServeur;
    double pourBoire;

    public int getIdServeur() {
        return idServeur;
    }

    public void setIdServeur(int idServeur) {
        this.idServeur = idServeur;
    }

    public double getPourBoire() {
        return pourBoire;
    }

    public void setPourBoire(double pourBoire) {
        this.pourBoire = pourBoire;
    }
    public List<DetailsCommandeServeur> getPourcentage(int idCommande) throws Exception{
        String req = "SELECT sum(quantite*lastPrix*pourBoire)  pourBoire,idServeur from detailsCommandeServeur  where idCommande =  '"+idCommande+"' group by idServeur";
        System.out.println(req);
        List plats = this.find(req, this);
        return plats;
    }
    

}
