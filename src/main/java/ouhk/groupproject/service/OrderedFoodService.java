package ouhk.groupproject.service;

import java.util.List;
import ouhk.groupproject.model.OrderedFood;

public interface OrderedFoodService {

    public List<OrderedFood> getOrderedFoods();
    
    public  List<OrderedFood> getOrderedFoods(long id);
    
}