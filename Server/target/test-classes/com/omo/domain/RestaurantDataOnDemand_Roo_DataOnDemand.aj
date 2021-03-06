// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.omo.domain;

import com.omo.domain.Restaurant;
import com.omo.domain.RestaurantDataOnDemand;
import com.omo.repository.RestaurantRepository;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect RestaurantDataOnDemand_Roo_DataOnDemand {
    
    declare @type: RestaurantDataOnDemand: @Component;
    
    private Random RestaurantDataOnDemand.rnd = new SecureRandom();
    
    private List<Restaurant> RestaurantDataOnDemand.data;
    
    @Autowired
    RestaurantRepository RestaurantDataOnDemand.restaurantRepository;
    
    public Restaurant RestaurantDataOnDemand.getNewTransientRestaurant(int index) {
        Restaurant obj = new Restaurant();
        setAddress(obj, index);
        setDescription(obj, index);
        setName(obj, index);
        return obj;
    }
    
    public void RestaurantDataOnDemand.setAddress(Restaurant obj, int index) {
        String address = "address_" + index;
        obj.setAddress(address);
    }
    
    public void RestaurantDataOnDemand.setDescription(Restaurant obj, int index) {
        String description = "description_" + index;
        obj.setDescription(description);
    }
    
    public void RestaurantDataOnDemand.setName(Restaurant obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public Restaurant RestaurantDataOnDemand.getSpecificRestaurant(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Restaurant obj = data.get(index);
        BigInteger id = obj.getId();
        return restaurantRepository.findOne(id);
    }
    
    public Restaurant RestaurantDataOnDemand.getRandomRestaurant() {
        init();
        Restaurant obj = data.get(rnd.nextInt(data.size()));
        BigInteger id = obj.getId();
        return restaurantRepository.findOne(id);
    }
    
    public boolean RestaurantDataOnDemand.modifyRestaurant(Restaurant obj) {
        return false;
    }
    
    public void RestaurantDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = restaurantRepository.findAll(new org.springframework.data.domain.PageRequest(from / to, to)).getContent();
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Restaurant' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Restaurant>();
        for (int i = 0; i < 10; i++) {
            Restaurant obj = getNewTransientRestaurant(i);
            try {
                restaurantRepository.save(obj);
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            data.add(obj);
        }
    }
    
}
