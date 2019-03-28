package ishop.DAO;


import ishop.entity.UserEntity;
import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.persistence.Query;

@Component
@Transactional
public class UsersDAO {
    private final Logger LOGGER = Logger.getLogger(getClass());
    @Resource(name = "sessionFactory")
    SessionFactory sessionFactory;


    public UserEntity create(UserEntity userEntity) {

        sessionFactory.getCurrentSession().save(userEntity);

        return userEntity;
    }

    public void updateUser(UserEntity user) {
        UserEntity mergedUser = (UserEntity) sessionFactory.getCurrentSession().merge(user);
        sessionFactory.getCurrentSession().update(mergedUser);
    }


    public void deleteUser(UserEntity user) {
        UserEntity mergedUser = (UserEntity) sessionFactory.getCurrentSession().merge(user);
        LOGGER.info("user delete" + "" + user);
        sessionFactory.getCurrentSession().delete(mergedUser);
    }

    public boolean isLoginExists(String nickname) {
        String userHQL = "FROM UserEntity WHERE nickname = :nickname";
        Query query = sessionFactory.getCurrentSession().createQuery(userHQL);
        query.setParameter("nickname", nickname);
        return query.getResultList().size() > 0;
    }

    public UserEntity getUserByName(String nickname) {
        String hql = "FROM UserEntity WHERE nickname = :nickname";
        org.hibernate.query.Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("nickname", nickname);
        UserEntity userEntity = (UserEntity) query.uniqueResult();
        return userEntity;
    }

    public Integer userSize() {
        String hql = "FROM UserEntity WHERE id>0";
        org.hibernate.query.Query query = sessionFactory.getCurrentSession().createQuery(hql);
       return query.getResultList().size();
    }


}
