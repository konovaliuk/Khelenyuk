package com.khelenyuk.controller.service.impl;


import com.khelenyuk.dao.mysql.impl.MealDAOImpl;
import com.khelenyuk.model.Meal;
import com.khelenyuk.model.MealToDisplay;
import com.khelenyuk.controller.service.IMenuService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.List;

public class MenuServiceImpl implements IMenuService {
    private static final Logger logger = LogManager.getLogger(MenuServiceImpl.class);

    //todo rewrite to Interface
    private static final MealDAOImpl MEAL_DAO_IMPL = new MealDAOImpl();
    private static MenuServiceImpl instance = new MenuServiceImpl();

    private MenuServiceImpl() {
    }

    public static MenuServiceImpl getInstance() {
        return instance;
    }

    @Override
    public boolean addMeal(Meal meal) {
        return MEAL_DAO_IMPL.add(meal);
    }

    @Override
    public List<MealToDisplay> getUserMenu(int id, LocalDate chosenDate) {
        return MEAL_DAO_IMPL.getMenu(id, chosenDate);
    }

    @Override

    public int getTotalWeight(List<MealToDisplay> menu) {
        int total = 0;
        for (MealToDisplay meal : menu
                ) {
            total += meal.getWeight();
        }
        return total;
    }

    @Override

    public String getTotalCalories(List<MealToDisplay> menu) {
        float total = 0.0f;
        for (MealToDisplay meal : menu
                ) {
            total += meal.getCalories();
        }
        return new DecimalFormat(".##").format(total);
    }

    @Override

    public String getTotalProteins(List<MealToDisplay> menu) {
        float total = 0.0f;
        for (MealToDisplay meal : menu
                ) {
            total += meal.getProtein();
        }
        return new DecimalFormat(".##").format(total);
    }

    @Override

    public String getTotalFat(List<MealToDisplay> menu) {
        float total = 0.0f;
        for (MealToDisplay meal : menu
                ) {
            total += meal.getFat();
        }
        return new DecimalFormat(".##").format(total);
    }

    @Override

    public String getTotalCarbs(List<MealToDisplay> menu) {
        float total = 0.0f;
        for (MealToDisplay meal : menu
                ) {
            total += meal.getCarbs();
        }
        return new DecimalFormat(".##").format(total);
    }
}
