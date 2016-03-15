package project.dao;

import org.springframework.stereotype.Repository;
import project.model.User;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {

    @PersistenceContext
    private EntityManager entityManager;

    public List<User> getAllUsers() {
        List<User> users = entityManager.createQuery("from User", User.class).getResultList();
        return users;
    }

    public void add(User user) {
        entityManager.persist(user);
    }

    public void remove(Integer userId) {

    }

    public User findByUserId(Integer id) {
        User user = entityManager.find(User.class,id);
        return user;
    }

    public User findByUserName(String username) {
        User user;
        try{
            user = entityManager.createQuery("SELECT u FROM User u where u.username = :name",User.class)
                    .setParameter("name", username).getSingleResult();
            return user;
        } catch (NoResultException nre){
            user = null;
            return user;
        }
    }

    public void updateImage(Integer id, String url) {
        User user = entityManager.getReference(User.class,id);
        user.setUrl(url);
    }

    public void updateContent(Integer id, User user) {
        User newUser = entityManager.getReference(User.class,id);
        newUser.setFirstName(user.getFirstName());
        newUser.setLastName(user.getLastName());
        newUser.setCity(user.getCity());
        newUser.setJob(user.getJob());
        newUser.setStyle(user.getStyle());
    }

    public Boolean alreadyExist(String username) {
        User user;
        try {
            user = entityManager.createQuery("SELECT u FROM User u WHERE u.username=:name", User.class)
                    .setParameter("name", username).getSingleResult();
            return true;
        }catch (NoResultException e){
            return false;
        }
    }
}
