// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.omo.domain;

import com.omo.domain.MenuItem;
import java.math.BigInteger;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Persistent;

privileged aspect MenuItem_Roo_Mongo_Entity {
    
    declare @type: MenuItem: @Persistent;
    
    @Id
    private BigInteger MenuItem.id;
    
    public BigInteger MenuItem.getId() {
        return this.id;
    }
    
    public void MenuItem.setId(BigInteger id) {
        this.id = id;
    }
    
}