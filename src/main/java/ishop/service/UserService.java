package ishop.service;

import ishop.DAO.UsersDAO;

import ishop.entity.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserService {
    @Autowired
    UsersDAO userDao;

    public void createUser(UserEntity userEntity) {
        userDao.create(userEntity);
    }
    public void updateUser(UserEntity user) {
        userDao.updateUser(user);
    }
    public void deleteUser(UserEntity userEntity) {
        userDao.deleteUser(userEntity);
    }
    public boolean isLoginExists(String login) {
        return userDao.isLoginExists(login);
    }
    public UserEntity getUserByName(String name){
       return userDao.getUserByName(name);
    }
    public Integer getUserSize(){
        return userDao.userSize();
    }
}
