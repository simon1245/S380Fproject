package ouhk.groupproject.service;

import java.io.IOException;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ouhk.groupproject.dao.CommentRepository;
import ouhk.groupproject.dao.MenuRepository;
import ouhk.groupproject.dao.WebUserRepository;
import ouhk.groupproject.model.Comment;
import ouhk.groupproject.model.Menu;

@Service
public class CommentServiceImpl implements CommentService {

    @Resource
    private CommentRepository commentRepo;

    @Resource
    private MenuRepository menuRepo;

    @Resource
    private WebUserRepository webuserRepo;

    @Override
    @Transactional
    public List<Comment> getComments() {
        return commentRepo.findAll();
    }

    @Override
    @Transactional
    public List<Comment> getComment(long foodid) {
        return commentRepo.findByFoodid(foodid);
    }

    @Override
    @Transactional
    public long createComment(String username, String detail, long food_id) throws IOException {

        Comment comment = new Comment();
        comment.setFoodid(food_id);
        comment.setUsername(username);
        System.out.println("user__name");
        System.out.println(username);

        comment.setMenu(menuRepo.findById(food_id).orElse(null));
        comment.setDetail(detail);

        Menu updatedMenu = menuRepo.findById(food_id).orElse(null);

        updatedMenu.getComments().add(comment);
        Comment savedComment = commentRepo.save(comment);

        return savedComment.getId();
    }

}
