package ouhk.groupproject.service;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ouhk.groupproject.model.Orders;
import ouhk.groupproject.model.OrderedFood;
import ouhk.groupproject.dao.OrdersRepository;

@Service
public class OrdersServiceImpl implements OrdersService {

    @Resource
    private OrdersRepository ordersRepo;

    @Override
    public List<Orders> getOrders() {
        return ordersRepo.findAll();
    }

    @Override
    @Transactional
    public List<Orders> getOrders(String username) {
        return ordersRepo.findByusername(username);
    }

    @Override
    @Transactional
    public Orders getOrder(long order_Id) {
        return ordersRepo.findById(order_Id).orElse(null);
    }

    @Override
    @Transactional
    public long createOrder(String userName, int cost, Date ordertime, List<OrderedFood> orderFoods) throws IOException {
        Orders order = new Orders();
        order.setUsername(userName);
        order.setOrder_time(ordertime);
        order.setCost(cost);

        for (OrderedFood orderedFood : orderFoods) {
            orderedFood.setOrders(order);
            order.getOrderedFoods().add(orderedFood);
        }
        Orders savedorder = ordersRepo.save(order);
        return savedorder.getId();
    }
}
