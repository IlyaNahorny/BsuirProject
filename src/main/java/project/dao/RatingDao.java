package project.dao;

import project.model.Rating;

import java.util.List;

/**
 * Created by Ilya on 07.03.2016.
 */
public interface RatingDao {
    void addRating(Rating rating);
    void updateValue(Integer id, Rating rating);
}
