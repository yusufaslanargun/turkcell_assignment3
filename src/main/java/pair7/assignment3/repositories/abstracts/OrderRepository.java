package pair7.assignment3.repositories.abstracts;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pair7.assignment3.entities.Order;

import java.util.Optional;

@Repository
public interface OrderRepository extends JpaRepository<Order,Integer> {

}
