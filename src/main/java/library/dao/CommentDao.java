package library.dao;

import library.entity.Comment;
import library.entity.PostBook;
import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import javax.annotation.Resource;
import java.util.Comparator;
import java.util.List;

@Component
@Transactional
public class CommentDao {
    private final Logger LOGGER = Logger.getLogger(getClass());
    @Resource(name = "sessionFactory")
    public SessionFactory sessionFactory;

    public Comment createComment(Comment comment) {
        sessionFactory.getCurrentSession().save(comment);
        LOGGER.info("create comment" + "" + comment);
        return comment;
    }

    public Comment getCommentById(Long postId) {
        Comment post = sessionFactory.getCurrentSession().get(Comment.class, postId);
        LOGGER.info("get comment by id" + "" + postId);
        return post;
    }

    public void updateComment(Comment comment) {
        LOGGER.info("update comment" + "" + comment);
        sessionFactory.getCurrentSession().update(comment);

    }

    public void deleteComment(Comment comment) {
        Comment mergedPost = (Comment) sessionFactory.getCurrentSession().merge(comment);
        sessionFactory.getCurrentSession().delete(mergedPost);
        LOGGER.info("delete comment" + "" + comment);
    }

    public List<Comment> getCommentListByBook(String book) {
        String hql = "FROM PostBook WHERE text = :book";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("book", book);
        PostBook postBook = (PostBook) query.uniqueResult();
        List<Comment> result = postBook.getComments();
        Comparator<Comment> comparator = ((o1, o2) -> o1.getId().compareTo(o2.getId()));
        result.sort(comparator.reversed());
        LOGGER.info("get comment by book" + "" + book);
        return result;
    }



    public List<Comment> getAllComments() {
        String hql = "FROM Comment WHERE id>0 ORDER BY comment_date";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        List<Comment> comment = query.list();
        LOGGER.info("get all comments");
        return comment;
    }
}
