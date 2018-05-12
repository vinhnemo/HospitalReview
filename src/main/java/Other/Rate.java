/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Other;
/**
 *
 * @author Kuro
 */
public class Rate {
    private int ID;
    private float rate;
    private int dID;

    public Rate(int ID, float rate, int dID) {
        this.ID = ID;
        this.rate = rate;
        this.dID = dID;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public float getRate() {
        return rate;
    }

    public void setRate(float rate) {
        this.rate = rate;
    }

    public int getdID() {
        return dID;
    }

    public void setdID(int dID) {
        this.dID = dID;
    }
    
}
