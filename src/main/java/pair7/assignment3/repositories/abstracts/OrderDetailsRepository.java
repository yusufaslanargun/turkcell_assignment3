package pair7.assignment3.repositories.abstracts;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pair7.assignment3.entities.OrderDetails;
@Repository
public interface OrderDetailsRepository extends JpaRepository<OrderDetails,Integer> {

}
