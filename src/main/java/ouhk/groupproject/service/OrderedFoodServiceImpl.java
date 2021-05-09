package ouhk.groupproject.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ouhk.groupproject.dao.OrderedFoodRepository;
import ouhk.groupproject.model.OrderedFood;

@Service
public class OrderedFoodServiceImpl implements OrderedFoodService {

    @Resource
    private OrderedFoodRepository orderedFoodRepo;

    @Override
    public List<OrderedFood> getOrderedFoods() {
        return orderedFoodRepo.findAll();
    }

    @Override
    @Transactional
    public List<OrderedFood> getOrderedFoods(long orderid) {
        return orderedFoodRepo.findByorderid(orderid);
    }

}
