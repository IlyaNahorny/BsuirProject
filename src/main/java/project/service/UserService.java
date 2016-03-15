package project.service;

import project.model.User;

import java.util.List;

/**
 * Created by Ilya on 13.02.2016.
 */
public interface UserService  {
    public void add(User user);
    public List<User> getAllUsers();
    public User findByUserName(String username);
    public User findByUserId(Integer id);
    public boolean alreadyExist(String username);
    public void remove(Integer userId);
    public void updateImage(Integer id, String url);
    public void updateContent(Integer id, User user);
}
