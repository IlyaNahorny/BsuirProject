package project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.dao.RatingDao;
import project.model.Rating;

import javax.transaction.Transactional;

@Service
@Transactional
public class RatingServiceImpl implements RatingService {

    @Autowired
    RatingDao ratingDao;

    public void addRating(Rating rating) {
        ratingDao.addRating(rating);
    }

    public Rating alreadyExist(String username) {
        return ratingDao.alreadyExist(username);
    }

    public void updateValue(Integer id, Rating rating) {
        ratingDao.updateValue(id,rating);
    }
}
