package project.service;

import project.model.Material;
import project.model.Rating;

import java.util.List;

/**
 * Created by Ilya on 08.03.2016.
 */
public interface RatingService {
    void addRating(Rating rating);
    void setOrUpdateRating(Rating rating);
    int getRatingMaterial(Integer id);
    void updateValue(Integer id, Rating rating);
}
