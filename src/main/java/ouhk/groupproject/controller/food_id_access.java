/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ouhk.groupproject.controller;

/**
 *
 * @author alexk
 */
public class food_id_access {
    private static long food_id = 0;
    
    public void setID(long id){
        food_id = id;
    }
    
    public long getFoodID(){
        return food_id;
    }
}
