/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modele;

import java.util.ArrayList;
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
    
    public Produit insert(String nom, int idCat, String photo, double lastP){
        List <Produit> lp= new ArrayList<>();
        Produit p= new Produit();

        try{
           String req="INSERT INTO produit(nom,idCategorie,photo,lastPrix) VALUES ('"+nom+"','"+idCat+"','"+photo+"','"+lastP+"')";
           System.out.println(req);
           this.execute(req);
           lp=p.find("SELECT * FROM produit where idProduit = (select Max (idProduit) from produit)",p);
           return lp.get(0);
        }catch(Exception e){
           System.out.println(e.getMessage());
        }
        return null;
    }
    
    
    public static void main(String[] args){
        Produit p = new Produit();
        p.insert("Njuuuuuuuuuu", 2,"Huhuhu.jpg",25000.0);
    }

}
