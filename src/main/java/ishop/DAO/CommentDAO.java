package ishop.DAO;

import ishop.entity.CommentsEntity;
import ishop.entity.GoodsEntity;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.persistence.Query;
import java.util.Comparator;
import java.util.List;

@Component
@Transactional
public class CommentDAO {
    @Resource(name = "sessionFactory")
    SessionFactory sessionFactory;

    public List<CommentsEntity> getAllComments() {
        String hql = "FROM CommentsEntity WHERE id>0";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        List<CommentsEntity> result = query.getResultList();
        return result;
    }
    public List<CommentsEntity> getCommentListByName(String name){
        String hql = "FROM GoodsEntity WHERE name = :name";
        org.hibernate.query.Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("name", name);
        GoodsEntity good = (GoodsEntity)query.uniqueResult();
        List<CommentsEntity> result = good.getComments();
       /* Comparator<CommentsEntity> commentsEntityComparator = (((o1, o2) -> o1.getCommentdate().compareTo(o2.getCommentdate())));
        result.sort(commentsEntityComparator.reversed());*/
        return result;
    }
    public CommentsEntity createComment(CommentsEntity comment) {
        sessionFactory.getCurrentSession().save(comment);
        return comment;
    }

}

