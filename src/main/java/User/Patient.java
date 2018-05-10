/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

/**
 *
 * @author TGMaster
 */
public class Patient {
    private int ID;
    private String fname;
    private String lname;
    private String sex;
    private String email;
    private String pass;
    private String address;
    private String lang;

    public Patient() {
    }

    public Patient(int ID, String fname, String lname, String sex, String email, String pass, String address, String lang) {
        this.ID = ID;
        this.fname = fname;
        this.lname = lname;
        this.sex = sex;
        this.email = email;
        this.pass = pass;
        this.address = address;
        this.lang = lang;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getLang() {
        return lang;
    }

    public void setLang(String lang) {
        this.lang = lang;
    }
    
    
}
