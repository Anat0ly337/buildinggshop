package library.dao;

import library.entity.PostBook;
import library.entity.UserEntity;
import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.persistence.Query;
import java.util.List;


@Component
@Transactional
public class PostBookDao {
    private final Logger LOGGER = Logger.getLogger(getClass());

    @Resource(name = "sessionFactory")
    public SessionFactory sessionFactory;

    public PostBook createPost(PostBook post) {
        sessionFactory.getCurrentSession().save(post);
        LOGGER.info("create post" + "" + post);
        return post;
    }

    public PostBook getPostById(Long postId) {
        PostBook post = sessionFactory.getCurrentSession().get(PostBook.class, postId);
        LOGGER.info("get post by id" + "" + postId);
        return post;
    }

    public PostBook getPostByText(String text) {
        String hql = "FROM PostBook WHERE text = :text";
        org.hibernate.query.Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("text", text);
        LOGGER.info("get post by text" + "" + text);
        return (PostBook) query.uniqueResult();
    }

    public List<PostBook> getPostListByText(String txt) {
        String hql = "FROM PostBook WHERE text LIKE '%" + txt + "%'";
        org.hibernate.query.Query query = sessionFactory.getCurrentSession().createQuery(hql);
        List<PostBook> bookList = query.getResultList();
        LOGGER.info("get list posts by text" + "" + txt);
        return bookList;
    }

    public void updatePost(PostBook post) {
        sessionFactory.getCurrentSession().update(post);
        LOGGER.info("update post" + "" + post);
    }

    public void deletePost(PostBook post) {
        PostBook mergedPost = (PostBook) sessionFactory.getCurrentSession().merge(post);
        sessionFactory.getCurrentSession().delete(mergedPost);
        LOGGER.info("delete post" + "" + post);
    }

    public List<PostBook> getAllThePosts() {
        String hql = "FROM PostBook WHERE id>0 ORDER BY post_date DESC";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        List<PostBook> result = query.getResultList();
        LOGGER.info("get all posts");
        return result;
    }

    public List<PostBook> getAllBooksByUser(String nickname) {
        String hql = "FROM UserEntity WHERE nickname = :nickname";
        org.hibernate.query.Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("nickname", nickname);
        UserEntity user = (UserEntity) query.uniqueResult();
        List<PostBook> result = user.getPostBooks();
        LOGGER.info("get all posts by user" +  "" + nickname);
        return result;
    }

    public boolean isPostExist(String text) {
        String userHQL = "FROM PostBook WHERE text=:text";
        org.hibernate.query.Query query = sessionFactory.getCurrentSession().createQuery(userHQL);
        query.setParameter("text", text);
        List postname = query.list();
        return postname.size() > 0;
    }
}
