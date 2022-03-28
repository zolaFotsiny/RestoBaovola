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
public class Ingredient extends BDTable{
    int idIngredient;
    String nomIngredient;

    public int getIdIngredient() {
        return idIngredient;
    }

    public void setIdIngredient(int idIngredient) {
        this.idIngredient = idIngredient;
    }

    public String getNomIngredient() {
        return nomIngredient;
    }

    public void setNomIngredient(String nomIngredient) {
        this.nomIngredient = nomIngredient;
    }
    
    public String nomIngredient(int idIng) throws Exception{
        String requete = "SELECT nom from ingredient WHERE idIngredient = "+idIng;
        return this.selectString(requete);
    }
}
