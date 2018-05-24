/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User.DTO;

/**
 *
 * @author NemoVinh
 */
public class Doc_on_hospital extends Doctor {
    private String Specialty;
    private String Oaad;
    private String Healfunds;
    private String OperT;  
    private String FL;
    private boolean HA;
    private boolean guildedog;
    private boolean Slang;
    private boolean parking;
    private boolean ramp;
    private boolean handles;
    private boolean couch ;

    public Doc_on_hospital() {
    }

    public Doc_on_hospital(String Specialty, String Oaad, String Healfunds, String OperT, String FL, boolean HA, boolean guildedog, boolean Slang, boolean parking, boolean ramp, boolean handles, boolean couch) {
        this.Specialty = Specialty;
        this.Oaad = Oaad;
        this.Healfunds = Healfunds;
        this.OperT = OperT;
        this.FL = FL;
        this.HA = HA;
        this.guildedog = guildedog;
        this.Slang = Slang;
        this.parking = parking;
        this.ramp = ramp;
        this.handles = handles;
        this.couch = couch;
    }

    public Doc_on_hospital(String Specialty, String Oaad, String Healfunds, String OperT, String FL, boolean HA, boolean guildedog, boolean Slang, boolean parking, boolean ramp, boolean handles, boolean couch, int ID, String fname, String lname, String sex, String degree, boolean insurance, String speciality, String hours, String lang, int allowReview) {
        super(ID, fname, lname, sex, degree, insurance, speciality, hours, lang, allowReview);
        this.Specialty = Specialty;
        this.Oaad = Oaad;
        this.Healfunds = Healfunds;
        this.OperT = OperT;
        this.FL = FL;
        this.HA = HA;
        this.guildedog = guildedog;
        this.Slang = Slang;
        this.parking = parking;
        this.ramp = ramp;
        this.handles = handles;
        this.couch = couch;
    }

    public String getSpecialty() {
        return Specialty;
    }

    public void setSpecialty(String Specialty) {
        this.Specialty = Specialty;
    }

    public String getOaad() {
        return Oaad;
    }

    public void setOaad(String Oaad) {
        this.Oaad = Oaad;
    }

    public String getHealfunds() {
        return Healfunds;
    }

    public void setHealfunds(String Healfunds) {
        this.Healfunds = Healfunds;
    }

    public String getOperT() {
        return OperT;
    }

    public void setOperT(String OperT) {
        this.OperT = OperT;
    }

    public String getFL() {
        return FL;
    }

    public void setFL(String FL) {
        this.FL = FL;
    }

    public boolean isHA() {
        return HA;
    }

    public void setHA(boolean HA) {
        this.HA = HA;
    }

    public boolean isGuildedog() {
        return guildedog;
    }

    public void setGuildedog(boolean guildedog) {
        this.guildedog = guildedog;
    }

    public boolean isSlang() {
        return Slang;
    }

    public void setSlang(boolean Slang) {
        this.Slang = Slang;
    }

    public boolean isParking() {
        return parking;
    }

    public void setParking(boolean parking) {
        this.parking = parking;
    }

    public boolean isRamp() {
        return ramp;
    }

    public void setRamp(boolean ramp) {
        this.ramp = ramp;
    }

    public boolean isHandles() {
        return handles;
    }

    public void setHandles(boolean handles) {
        this.handles = handles;
    }

    public boolean isCouch() {
        return couch;
    }

    public void setCouch(boolean couch) {
        this.couch = couch;
    }
    
    
}
