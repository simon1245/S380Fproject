package ouhk.groupproject.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import ouhk.groupproject.model.UserRole;

public interface UserRoleRepository extends JpaRepository<UserRole, Integer> {
}

