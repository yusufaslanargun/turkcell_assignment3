package pair7.assignment3.services.concrete;

import pair7.assignment3.entities.Review;
import pair7.assignment3.repositories.abstracts.ReviewRepository;
import pair7.assignment3.services.abstracts.ReviewService;

import java.util.List;

public class ReviewServiceImpl implements ReviewService {
    private final ReviewRepository reviewRepository;

    public ReviewServiceImpl(ReviewRepository reviewRepository) {
        this.reviewRepository = reviewRepository;
    }

    @Override
    public List<Review> getAll() {
        return reviewRepository.findAll();
    }
}

