// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.omo.service;

import com.omo.domain.Menu;
import com.omo.repository.MenuRepository;
import com.omo.service.MenuServiceImpl;
import java.math.BigInteger;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect MenuServiceImpl_Roo_Service {
    
    declare @type: MenuServiceImpl: @Service;
    
    declare @type: MenuServiceImpl: @Transactional;
    
    @Autowired
    MenuRepository MenuServiceImpl.menuRepository;
    
    public long MenuServiceImpl.countAllMenus() {
        return menuRepository.count();
    }
    
    public void MenuServiceImpl.deleteMenu(Menu menu) {
        menuRepository.delete(menu);
    }
    
    public Menu MenuServiceImpl.findMenu(BigInteger id) {
        return menuRepository.findOne(id);
    }
    
    public List<Menu> MenuServiceImpl.findAllMenus() {
        return menuRepository.findAll();
    }
    
    public List<Menu> MenuServiceImpl.findMenuEntries(int firstResult, int maxResults) {
        return menuRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void MenuServiceImpl.saveMenu(Menu menu) {
        menuRepository.save(menu);
    }
    
    public Menu MenuServiceImpl.updateMenu(Menu menu) {
        return menuRepository.save(menu);
    }
    
}
