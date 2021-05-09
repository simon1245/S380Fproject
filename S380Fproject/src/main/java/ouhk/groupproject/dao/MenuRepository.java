package ouhk.groupproject.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import ouhk.groupproject.model.Menu;

public interface MenuRepository extends JpaRepository<Menu, Long> {
}
