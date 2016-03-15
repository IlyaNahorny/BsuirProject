package project.dao;

import project.model.User;

import java.util.List;

/**
 * Created by Ilya on 13.02.2016.
 */
public interface UserDao {

    public List<User> getAllUsers();
    public void add(User user);
    public void remove(Integer userId);
    public User findByUserName(String username);
    public User findByUserId(Integer id);
    public Boolean alreadyExist(String username);
    public void updateImage(Integer id, String url);
    public void updateContent(Integer id, User user);
}
