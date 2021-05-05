package ouhk.groupproject.service;

import java.io.IOException;
import java.util.List;
import ouhk.groupproject.model.Comment;

public interface CommentService {
    
    public List<Comment> getComments();
    
    public  List<Comment> getComment(long foodid);

    public long createComment(String username, String detail,long food_id) throws IOException;
 

}

