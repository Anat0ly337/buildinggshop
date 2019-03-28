package ishop.DAO;

import ishop.entity.LikesEntity;
import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Component
@Transactional
public class LikeDAO {
    private final Logger LOGGER = Logger.getLogger(getClass());
    @Resource(name = "sessionFactory")
    SessionFactory sessionFactory;


    public LikesEntity createLike(LikesEntity likesEntity){
        sessionFactory.getCurrentSession().save(likesEntity);
        return likesEntity;
    }
}
