package project.service;

import project.model.Rating;

/**
 * Created by Ilya on 08.03.2016.
 */
public interface RatingService {
    void addRating(Rating rating);
    Rating alreadyExist(String username);
    void updateValue(Integer id, Rating rating);
}
