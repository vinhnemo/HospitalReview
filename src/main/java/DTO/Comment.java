/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author Kuro
 */
public class Comment {

    private Integer ID;
    private String comment;
    private Integer dID;
    private Integer pID;

    public Comment(int ID, String comment, int dID, int pID) {
        this.ID = ID;
        this.comment = comment;
        this.dID = dID;
        this.pID = pID;
    }

    public Comment() {

    }

    public Integer getpID() {
        return pID;
    }

    public void setpID(Integer pID) {
        this.pID = pID;
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
