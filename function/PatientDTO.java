/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Patients;

/**
 *
 * @author user
 */
public class PatientDTO {
    private int p_id;
    private String p_fname;
    private String p_lname;
    private String p_gender;
    private String p_email;
    private String p_pass;
    private String p_address;
    private String p_language;

    public PatientDTO() {
    }

    public PatientDTO(int p_id, String p_fname, String p_lname, String p_gender, String p_email, String p_pass, String p_address, String p_language) {
        this.p_id = p_id;
        this.p_fname = p_fname;
        this.p_lname = p_lname;
        this.p_gender = p_gender;
        this.p_email = p_email;
        this.p_pass = p_pass;
        this.p_address = p_address;
        this.p_language = p_language;
    }

    public int getP_id() {
        return p_id;
    }

    public void setP_id(int p_id) {
        this.p_id = p_id;
    }

    public String getP_fname() {
        return p_fname;
    }

    public void setP_fname(String p_fname) {
        this.p_fname = p_fname;
    }

    public String getP_lname() {
        return p_lname;
    }

    public void setP_lname(String p_lname) {
        this.p_lname = p_lname;
    }

    public String getP_gender() {
        return p_gender;
    }

    public void setP_gender(String p_gender) {
        this.p_gender = p_gender;
    }

    public String getP_email() {
        return p_email;
    }

    public void setP_email(String p_email) {
        this.p_email = p_email;
    }

    public String getP_pass() {
        return p_pass;
    }

    public void setP_pass(String p_pass) {
        this.p_pass = p_pass;
    }

    public String getP_address() {
        return p_address;
    }

    public void setP_address(String p_address) {
        this.p_address = p_address;
    }

    public String getP_language() {
        return p_language;
    }

    public void setP_language(String p_language) {
        this.p_language = p_language;
    }
            
    
}
