package com.omo.service;


import com.omo.domain.Menu;
import com.omo.domain.MenuItem;

import java.math.BigInteger;
import java.util.ArrayList;

public class MenuServiceImpl implements MenuService {
    private static final String INDENT = "   ";
    private static final String NEW_LINE = "\n";

    private static org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(MenuServiceImpl.class);

    public ArrayList<String> getMenuAsHTML(BigInteger menuId) throws Exception {
        logger.debug("getMenuAsHTML - loading html for menu " + menuId +  "...");
        ArrayList<String> html = new ArrayList<String>();
        html.add(NEW_LINE + "<!-- begin generated menu html -->" + NEW_LINE);
        html.add("<div>" + NEW_LINE);
        Menu menu = findMenu(menuId);
        html.add("   <ul id='menu_" + menuId + "'>" + NEW_LINE);
        for (MenuItem menuItem: menu.getMenuItems()) {
            loadMenuItem(menuItem, html, 0);
        }
        html.add("   </ul>" + NEW_LINE);
        html.add("</div>" + NEW_LINE);
        html.add("<!-- end generated menu html -->" + NEW_LINE);
        logger.debug("Loading html for menu complete. Lines:" + html.size());
        return html;
    }


    private void loadMenuItem(MenuItem menuItem, ArrayList<String> html, Integer level) throws Exception {
        //logger.debug("   loadMenuItem...");
        String totalIndention = String.format(String.format("%%0%dd", level+1), 0).replace("0", INDENT);//adds level+1 number of indents to total indents

        boolean checked = false;
        if (menuItem.getType().equals(MenuItem.MenuItemTypes.MenuGroup)) {
            html.add("<br/>");
            html.add("<h3>" + menuItem.getName() + "</h3>");
        } else if (menuItem.getType().equals(MenuItem.MenuItemTypes.MenuItem)) {
            html.add(totalIndention + "<li class=\"nodeLevel" + level + "\"><input type=\"checkbox\" "  + checked
                    + " name=\"menuitem_" + menuItem.getName() + "\" value=\"" + menuItem.getName() + "\">"
                    + "<label>" + menuItem.getName() + " </label>" + NEW_LINE);
        } else
            throw new Exception("Invalid Menu Item Type: \"" + menuItem.getType() + "\"");

        //int grandchildren = countGrandchildren(employee, employees);
        if (menuItem.getChildMenuItems().size() > 0) {
            html.add(totalIndention + INDENT + "<ul id='" + menuItem.getName() + "'>" + NEW_LINE);
            for (MenuItem child: menuItem.getChildMenuItems()) {
                loadMenuItem(child, html, level + 2);
            }
            html.add(totalIndention + INDENT + "</ul>" + NEW_LINE);
        }
    }

/*
    private static int countGrandchildren(MenuItem menuItem, HashMap<String, MenuItem> menuItems) {
        int count=0;
        MenuItem child;
        for (MenuItem item: menuItem.getChildMenuItems()) {
            child = employees.get(childId);
            count += child.getChildren().size();
        }
        return count;
    }
*/



}
