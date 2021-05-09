package ouhk.groupproject.service;

import java.io.IOException;
import java.util.List;
import ouhk.groupproject.exception.CommentNotFound;
import ouhk.groupproject.model.Comment;

public interface CommentService {

    public List<Comment> getComments();

    public List<Comment> getComments(long foodid);

    public Comment getComment(long commentid);

    public long createComment(String username, String detail, long food_id) throws IOException;

    public void updateMenu(long id, String detail) throws IOException, CommentNotFound;

    public void deleteComment(long food_id, long id) throws CommentNotFound;
}
