package ishop.DAO;

import ishop.entity.GoodsEntity;
import ishop.entity.UserEntity;
import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import java.util.List;

@Component
@Transactional
public class GoodsDAO {
    private final Logger LOGGER = Logger.getLogger(getClass());
    @Resource(name = "sessionFactory")
    SessionFactory sessionFactory;



    public GoodsEntity create(GoodsEntity goodsEntity) {
        sessionFactory.getCurrentSession().save(goodsEntity);
        return goodsEntity;
    }

    public List<GoodsEntity> getAllGoods() {
        String hql = "FROM GoodsEntity WHERE id>0";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        List<GoodsEntity> result = query.getResultList();
        LOGGER.info("get all posts");
        return result;
    }

    public List<GoodsEntity> getGoodsByPrice(int fromm, int to) {
       /* int a = Integer.parseInt(from);
        int b = Integer.parseInt(to);*/
//        String hql = "FROM GoodsEntity WHERE price BETWEEN '%\" + a  + \"%' AND '%\" + b + \"%'";
        String one = "40";
        String two = "52";
        String hql = "FROM GoodsEntity WHERE price BETWEEN " + fromm + "  AND '" + to + "' ";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        List<GoodsEntity> result = query.getResultList();
        return result;
    }

    public List<GoodsEntity> getEntityListByName(String name) {
        String hql = "FROM GoodsEntity WHERE name = '" + name + "'";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        List<GoodsEntity> goodsEntityList = query.getResultList();
        return goodsEntityList;
    }

    public List<GoodsEntity> getEntityGoodBySortPriceASC() {
        String hql = "FROM GoodsEntity ORDER BY price";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        List<GoodsEntity> result = query.getResultList();
        return result;

    }

    public List<GoodsEntity> getEntityGoodBySortPriceDESC() {
        String hql = "FROM GoodsEntity ORDER BY price DESC";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        List<GoodsEntity> result = query.getResultList();
        return result;
    }
    public List<GoodsEntity> getEntityGoodBySortLikesASC() {
        String hql = "FROM GoodsEntity ORDER BY likesamount";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        List<GoodsEntity> result = query.getResultList();
        return result;

    }
    public List<GoodsEntity> getEntityGoodBySortLikesDESC() {
        String hql = "FROM GoodsEntity ORDER BY likesamount DESC";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        List<GoodsEntity> result = query.getResultList();
        return result;
    }
    public GoodsEntity getGoodByName(String name){
        String hql = "FROM GoodsEntity WHERE name = :name";
        org.hibernate.query.Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("name", name);
        GoodsEntity goodsEntity = (GoodsEntity) query.uniqueResult();
        return goodsEntity;
    }

}
