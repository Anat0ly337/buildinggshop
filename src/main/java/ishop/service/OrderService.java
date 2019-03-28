package ishop.service;

import ishop.DAO.OrdersDAO;
import ishop.entity.CommentsEntity;
import ishop.entity.OrderListEntity;
import ishop.entity.OrdersEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class OrderService {
    @Autowired
    OrdersDAO ordersDAO;

    public OrderListEntity createOrderList(OrderListEntity commentsEntity){
        return ordersDAO.createList(commentsEntity);
    }
    public OrdersEntity createOrder(OrdersEntity commentsEntity){
        return ordersDAO.createOrder(commentsEntity);
    }
    public List<OrderListEntity> getOrderListByID(Integer id){
        return ordersDAO.getOrderListByID(id);
    }
}
