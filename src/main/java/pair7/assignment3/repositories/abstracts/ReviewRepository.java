package pair7.assignment3.repositories.abstracts;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pair7.assignment3.entities.Review;
@Repository
public interface ReviewRepository extends JpaRepository<Review,Integer> {
}
