package com.omo.repository;

import com.omo.domain.MenuItem;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = MenuItem.class)
public interface MenuItemRepository {

    List<com.omo.domain.MenuItem> findAll();
}
