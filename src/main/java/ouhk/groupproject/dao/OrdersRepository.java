package ouhk.groupproject.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import ouhk.groupproject.model.Orders;

public interface OrdersRepository extends JpaRepository<Orders, Long> {
}

