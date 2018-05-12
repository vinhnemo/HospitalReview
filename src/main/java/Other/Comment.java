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
public class Comment {
    private int ID;
    private String comment;
    private int dID;

    public Comment(int ID, String comment, int dID) {
        this.ID = ID;
        this.comment = comment;
        this.dID = dID;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getdID() {
        return dID;
    }

    public void setdID(int dID) {
        this.dID = dID;
    }
    
}
