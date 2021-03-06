// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.omo.service;

import com.omo.domain.Menu;
import com.omo.service.MenuService;
import java.math.BigInteger;
import java.util.List;

privileged aspect MenuService_Roo_Service {
    
    public abstract long MenuService.countAllMenus();    
    public abstract void MenuService.deleteMenu(Menu menu);    
    public abstract Menu MenuService.findMenu(BigInteger id);    
    public abstract List<Menu> MenuService.findAllMenus();    
    public abstract List<Menu> MenuService.findMenuEntries(int firstResult, int maxResults);    
    public abstract void MenuService.saveMenu(Menu menu);    
    public abstract Menu MenuService.updateMenu(Menu menu);    
}
