package com.omo.domain;

import javax.persistence.CascadeType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

import java.util.HashSet;
import java.util.Set;

@RooJavaBean
@RooToString
@RooMongoEntity
public class MenuItem {

    private String name;

    private String description;
    private Integer sortOrder;
    private MenuItemTypes type;
    private float price;
    @OneToMany(cascade = CascadeType.ALL)
    private Set<MenuItem> childMenuItems = new HashSet<MenuItem>();

}
