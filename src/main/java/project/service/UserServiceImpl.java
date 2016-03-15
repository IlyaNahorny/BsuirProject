package project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.dao.UserDao;
import project.dao.UserRoleDao;
import project.model.User;
import project.model.UserRole;

import javax.transaction.Transactional;
import java.util.List;

@Transactional
@Service
public class UserServiceImpl implements  UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private UserRoleDao userRoleDao;

    public User findByUserId(Integer id) {
        return userDao.findByUserId(id);
    }

    public void add(User user) {
        UserRole userRole = new UserRole();
        userRole.setUser(user);
        userRole.setRole("ROLE_USER");
        user.setEnabled(true);
        user.setUrl("https://vk.com/images/camera_200.png");
        user.setStyle("default");
        userDao.add(user);
        userRoleDao.add(userRole);
    }

    public void updateContent(Integer id, User user) {
        userDao.updateContent(id,user);
    }

    public void updateImage(Integer id, String url) {
        userDao.updateImage(id,url);
    }

    public List<User> getAllUsers() {
        return userDao.getAllUsers();
    }

    public User findByUserName(String username) {
        return userDao.findByUserName(username);
    }

    public boolean alreadyExist(String username) {
        return userDao.alreadyExist(username);
    }

    public void remove(Integer userId) {

    }
}
