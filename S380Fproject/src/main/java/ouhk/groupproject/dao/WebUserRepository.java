package ouhk.groupproject.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import ouhk.groupproject.model.WebUser;

public interface WebUserRepository extends JpaRepository<WebUser, String> {
}
