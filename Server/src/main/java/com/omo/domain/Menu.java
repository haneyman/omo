package com.omo.domain;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.*;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooMongoEntity
public class Menu {
    private String name;
    private String description;

    @OneToOne
    private Restaurant restaurant;

    @OneToMany(cascade = CascadeType.ALL)
    private Set<MenuItem> menuItems = new HashSet<MenuItem>();
}
