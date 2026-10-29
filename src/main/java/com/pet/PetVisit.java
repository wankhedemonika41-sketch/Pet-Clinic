
package com.pet;

import java.math.BigDecimal;
import java.sql.Date;
public class PetVisit {
    private int id;
    private String ownerName;
    private String petType;
    private BigDecimal charges;
    private Date visitDate;

    public PetVisit(int id, String ownerName, String petType,
                    BigDecimal charges, Date visitDate) {
        this.id = id;
        this.ownerName = ownerName;
        this.petType = petType;
        this.charges = charges;
        this.visitDate = visitDate;
    }
    public int getId() {
        return id;
    }
    public String getOwnerName() {
        return ownerName;
    }
    public String getPetType() {
        return petType;
    }
    public BigDecimal getCharges() {
        return charges;
    }
    public Date getVisitDate() {
        return visitDate;
    }
}
