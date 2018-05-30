/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author MSI
 */
public class Specialty {
private Integer ID;
private String specialty;
private String spec_specialty;
    public Specialty(int ID, String specialty, String spec_specialty) {
        this.ID = ID;
        this.specialty=specialty;
        this.spec_specialty=spec_specialty;
    }

    public Specialty() {
    }
    
    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public String getSpecialty() {
        return specialty;
    }

    public void setSpecialty(String specialty) {
        this.specialty = specialty;
    }

    public String getSpec_specialty() {
        return spec_specialty;
    }

    public void setSpec_specialty(String spec_specialty) {
        this.spec_specialty = spec_specialty;
    }
    
    
}
