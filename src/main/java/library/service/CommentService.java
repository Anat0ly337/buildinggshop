package library.service;

import library.dao.CommentDao;
import library.entity.Comment;
import library.entity.PostBook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("commentService")
@Transactional
public class CommentService {
    @Autowired
    CommentDao commentDao;

    public Comment createComment(Comment comment) {
        return commentDao.createComment(comment);
    }
    public Comment getCommentById(Long postId) {
        return commentDao.getCommentById(postId);
    }
    public void updateComment(Comment post) {
        commentDao.updateComment(post);
    }
    public void deleteComment(Comment post) {
        commentDao.deleteComment(post);
    }
    public List<Comment> getCommentListByBook(String book) {
        return commentDao.getCommentListByBook(book);
    }
    public List<Comment> getAllComments(){
        return commentDao.getAllComments();
    }


}
