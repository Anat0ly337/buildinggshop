package ishop.DAO;

import ishop.entity.CommentsEntity;
import ishop.entity.GoodsEntity;
import ishop.entity.OrderListEntity;
import ishop.entity.OrdersEntity;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Component
@Transactional
public class OrdersDAO {
    @Resource(name = "sessionFactory")
    SessionFactory sessionFactory;


    public OrderListEntity createList(OrderListEntity orderListEntity) {
        sessionFactory.getCurrentSession().save(orderListEntity);
        return orderListEntity;
    }


    public OrdersEntity createOrder(OrdersEntity orderListEntity) {
        sessionFactory.getCurrentSession().save(orderListEntity);
        return orderListEntity;
    }

    public List<OrderListEntity> getOrderListByID(Integer id) {
        String hql = "FROM OrdersEntity WHERE id = :id";
        org.hibernate.query.Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("id", id);
        OrdersEntity order = (OrdersEntity) query.uniqueResult();
        List<OrderListEntity> result = order.getOrdersEntityList();
       /* Comparator<CommentsEntity> commentsEntityComparator = (((o1, o2) -> o1.getCommentdate().compareTo(o2.getCommentdate())));
        result.sort(commentsEntityComparator.reversed());*/
        return result;
    }

}
