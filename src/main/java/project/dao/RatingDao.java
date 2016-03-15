package project.dao;

import project.model.Rating;

/**
 * Created by Ilya on 07.03.2016.
 */
public interface RatingDao {
    void addRating(Rating rating);
    Rating alreadyExist(String username);
    void updateValue(Integer id, Rating rating);
}
