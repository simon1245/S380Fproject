package ouhk.groupproject.service;

import java.io.IOException;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ouhk.groupproject.dao.CommentRepository;
import ouhk.groupproject.dao.MenuRepository;
import ouhk.groupproject.dao.WebUserRepository;
import ouhk.groupproject.exception.AttachmentNotFound;
import ouhk.groupproject.exception.CommentNotFound;
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
    public List<Comment> getComments(long foodid) {
        return commentRepo.findByFoodid(foodid);
    }
    
        @Override
    @Transactional
    public Comment getComment(long commentid) {
        return commentRepo.findById(commentid).orElse(null);
    }
    

    @Override
    @Transactional
    public long createComment(String username, String detail, long food_id) throws IOException {

        Comment comment = new Comment();
        comment.setFoodid(food_id);
        comment.setUsername(username);

        comment.setMenu(menuRepo.findById(food_id).orElse(null));
        comment.setDetail(detail);

        Menu updatedMenu = menuRepo.findById(food_id).orElse(null);

        updatedMenu.getComments().add(comment);
        Menu SavedMenu =  menuRepo.save(updatedMenu);

        return SavedMenu.getFood_id();
    }
      
    
    

    @Override
    @Transactional(rollbackFor = CommentNotFound.class)
    public void updateMenu(long id, String detail)
            throws IOException, CommentNotFound {
        Comment updatedComment = commentRepo.findById(id).orElse(null);
        if (updatedComment == null) {
            throw new CommentNotFound();
        }

        updatedComment.setDetail(detail);
        commentRepo.save(updatedComment);
    }

    @Override
    @Transactional(rollbackFor = CommentNotFound.class)
    public void deleteComment(long food_id, long id) throws CommentNotFound {
        Comment deletedComment = commentRepo.findById(id).orElse(null);
        if (deletedComment == null) {
            throw new CommentNotFound();
        }

        Menu menu = menuRepo.findById(food_id).orElse(null);
        for (Comment comment : menu.getComments()) {
            if (comment.getId()== id) {
                menu.deleteComment(comment);
                menuRepo.save(menu);
                return;
            }
        }
        throw new CommentNotFound();        
    }

}
