// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.omo.domain;

import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Persistent;

import java.math.BigInteger;

privileged aspect Menu_Roo_Mongo_Entity {
    
    declare @type: Menu: @Persistent;
    
    @Id
    private BigInteger Menu.id;
    
    public BigInteger Menu.getId() {
        return this.id;
    }
    
    public void Menu.setId(BigInteger id) {
        this.id = id;
    }
    
}
