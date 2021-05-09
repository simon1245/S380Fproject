package ouhk.groupproject.dao;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import ouhk.groupproject.model.Comment;

public interface CommentRepository extends JpaRepository<Comment, Long> {
    public List<Comment> findByFoodid(long foodid);
}
