package com.omo.domain;

import com.omo.repository.MenuItemRepository;
import com.omo.repository.RestaurantRepository;
import com.omo.service.MenuService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.test.RooIntegrationTest;

import java.util.Date;

@RooIntegrationTest(entity = Restaurant.class, transactional = false)
public class RestaurantIntegrationTest {
    @Autowired
    MenuService menuService;

    @Autowired
    MenuItemRepository menuItemRepository;

    @Autowired
    RestaurantRepository restaurantRepository;


    @Test
    public void testAddMenu() {
        Restaurant restaurant = new Restaurant();
        String restaurantName = "Restaurant " + new Date();
        restaurant.setName(restaurantName);
        restaurant.setDescription("Test Restaurant Description");
        restaurantRepository.save(restaurant);

        Menu menu = new Menu();
        menu.setName("Test Menu " + new Date());
        menu.setName("Description of test menu");
        //
        MenuItem groupItem = new MenuItem();
        groupItem.setName("Sandwiches");
        groupItem.setType(MenuItemTypes.MenuGroup);
        groupItem.setSortOrder(1);
        menu.getMenuItems().add(groupItem);

        MenuItem item = new MenuItem();
        item.setName("BLT");
        item.setType(MenuItemTypes.MenuItem);
        item.setSortOrder(2);
        groupItem.getChildMenuItems().add(item);

        item = new MenuItem();
        item.setName("Turkey");
        item.setType(MenuItemTypes.MenuItem);
        item.setSortOrder(3);
        groupItem.getChildMenuItems().add(item);

        item = new MenuItem();
        item.setName("Salami");
        item.setType(MenuItemTypes.MenuItem);
        item.setSortOrder(4);
        groupItem.getChildMenuItems().add(item);

        groupItem = new MenuItem();
        groupItem.setName("Cheese");
        groupItem.setType(MenuItemTypes.MenuGroup);
        groupItem.setSortOrder(2);
        menu.getMenuItems().add(groupItem);

        item = new MenuItem();
        item.setName("Provolone");
        item.setType(MenuItemTypes.MenuItem);
        item.setSortOrder(1);
        groupItem.getChildMenuItems().add(item);

        item = new MenuItem();
        item.setName("Cheddar");
        item.setType(MenuItemTypes.MenuItem);
        item.setSortOrder(2);
        groupItem.getChildMenuItems().add(item);

        item = new MenuItem();
        item.setName("Swiss");
        item.setType(MenuItemTypes.MenuItem);
        item.setSortOrder(3);
        groupItem.getChildMenuItems().add(item);


        //menu.setRestaurant("");
        menuService.saveMenu(menu);


    }
}
