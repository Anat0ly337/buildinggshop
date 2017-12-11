package library.dao;

import library.dto.UserDTO;
import library.entity.UserEntity;
import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Locale;

@Component
@Transactional
public class UserDao {
    private final Logger LOGGER = Logger.getLogger(getClass());
    @Autowired
    private MessageSource messageSource;
    @Resource(name = "sessionFactory")
    public SessionFactory sessionFactory;


    public UserEntity create(UserDTO userDTO) {
        UserEntity userEntity = new UserEntity();
        userEntity.setEmail(userDTO.getEmail());
        userEntity.setPassword(userDTO.getPassword());
        userEntity.setNickname(userDTO.getNickname());
        sessionFactory.getCurrentSession().save(userEntity);
        LOGGER.info("create user" +  "" + userDTO.getNickname());
        return userEntity;
    }

    public void updateUser(UserEntity user) {
        UserEntity mergedUser = (UserEntity) sessionFactory.getCurrentSession().merge(user);
        sessionFactory.getCurrentSession().update(mergedUser);
    }

    public void deleteUser(UserEntity user) {
        UserEntity mergedUser = (UserEntity) sessionFactory.getCurrentSession().merge(user);
        LOGGER.info("user delete" +  "" + user);
        sessionFactory.getCurrentSession().delete(mergedUser);
    }

    public boolean isLoginExists(String email) {
        String userHQL = "FROM UserEntity WHERE email = :email";
        Query query = sessionFactory.getCurrentSession().createQuery(userHQL);
        query.setParameter("email", email);
        return query.list().size() > 0;
    }

    public boolean isEmailExists(String email) {
        String userHQL = "FROM UserEntity WHERE email = :email";
        Query query = sessionFactory.getCurrentSession().createQuery(userHQL);
        query.setParameter("email", email);
        List userEntities = query.list();
        return userEntities.size() > 0;
    }

    public boolean isPasswpodExist(UserDTO user) {
        String password = user.getPassword();
        String userHQL = "FROM UserEntity WHERE password=:password";
        Query query = sessionFactory.getCurrentSession().createQuery(userHQL);
        query.setParameter("password", password);
        List userEntities = query.list();
        return userEntities.size() > 0;
    }

    public UserEntity getUserByNickName(String nickname) {
        String userHQL = "FROM  UserEntity WHERE nickname = :nickname";
        Query query = sessionFactory.getCurrentSession().createQuery(userHQL);
        query.setParameter("nickname", nickname);
        LOGGER.info("get user by nick" + "" + nickname);
        return (UserEntity) query.uniqueResult();
    }

    public String getUserNicknameByEmail(String email) {
        String hql = "FROM UserEntity WHERE email = :email";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("email", email);
        UserEntity userEntity = (UserEntity) query.uniqueResult();
        return userEntity.getNickname();
    }

}
