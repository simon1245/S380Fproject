package ouhk.groupproject.service;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import ouhk.groupproject.model.Orders;
import ouhk.groupproject.model.OrderedFood;

public interface OrdersService {

    public List<Orders> getOrders();

    public List<Orders> getOrders(String username);

    public long createOrder(String userName, int cost, Date ordertime, List<OrderedFood> orderFoods) throws IOException;

    public Orders getOrder(long id);

}
