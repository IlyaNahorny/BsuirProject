package project.dao;

import org.springframework.stereotype.Repository;
import project.model.Rating;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

/**
 * Created by Ilya on 07.03.2016.
 */
@Repository
public class RatingDaoImpl implements RatingDao {

    @PersistenceContext
    private EntityManager entityManager;

    public void addRating(Rating rating) {
        entityManager.persist(rating);
    }

    public Rating alreadyExist(String username) {
        Rating rating;
        try {
            rating = entityManager.createQuery("SELECT r FROM Rating r WHERE r.userName = :username", Rating.class)
                    .setParameter("username", username).getSingleResult();
            return rating;
        } catch (NoResultException nre) {
            return null;
        }
    }

    public void updateValue(Integer id, Rating rating) {
        Rating newRating = entityManager.getReference(Rating.class, id);
        newRating.setValue(rating.getValue());
    }
}
