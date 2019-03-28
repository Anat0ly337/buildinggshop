package ishop.service;

import ishop.DAO.CommentDAO;
import ishop.entity.CommentsEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CommentsService {
    @Autowired
    CommentDAO commentDAO;


    public List<CommentsEntity> getAllComments(){
       return commentDAO.getAllComments();
    }
    public List<CommentsEntity> getCommentListByName(String name){
        return commentDAO.getCommentListByName(name);
    }
    public CommentsEntity createComment(CommentsEntity commentsEntity){
        return commentDAO.createComment(commentsEntity);
    }
}
