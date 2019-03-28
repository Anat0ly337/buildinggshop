package ishop.service;

import ishop.DAO.LikeDAO;
import ishop.entity.LikesEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class LikeService {
    @Autowired
    LikeDAO userDao;

    public void createLike(LikesEntity userEntity) {
        userDao.createLike(userEntity);
    }
}

