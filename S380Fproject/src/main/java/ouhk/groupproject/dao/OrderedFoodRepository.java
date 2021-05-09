package ouhk.groupproject.dao;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import ouhk.groupproject.model.OrderedFood;

public interface OrderedFoodRepository extends JpaRepository<OrderedFood, Long> {
    public List<OrderedFood> findByorderid(long order_id);
}
