package pair7.assignment3.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pair7.assignment3.entities.Order;
import pair7.assignment3.entities.Review;
import pair7.assignment3.services.abstracts.ReviewService;

import java.util.List;

@RestController
@RequestMapping("/api/reviews")
public class ReviewsController {
    private ReviewService reviewService;
    public ReviewsController(ReviewService reviewService){
        this.reviewService =reviewService;
    }
    @GetMapping
    public List<Review> getAll(){
        return reviewService.getAll();
    }

}
