// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.omo.domain;

import com.omo.domain.Restaurant;
import java.math.BigInteger;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Persistent;

privileged aspect Restaurant_Roo_Mongo_Entity {
    
    declare @type: Restaurant: @Persistent;
    
    @Id
    private BigInteger Restaurant.id;
    
    public BigInteger Restaurant.getId() {
        return this.id;
    }
    
    public void Restaurant.setId(BigInteger id) {
        this.id = id;
    }
    
}
