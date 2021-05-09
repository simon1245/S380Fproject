package ouhk.groupproject.dao;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import ouhk.groupproject.model.Orders;

public interface OrdersRepository extends JpaRepository<Orders, Long> {
    
        public List<Orders> findByusername(String username);
}

