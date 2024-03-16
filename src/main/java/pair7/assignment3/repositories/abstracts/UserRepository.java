package pair7.assignment3.repositories.abstracts;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pair7.assignment3.entities.*;
import pair7.assignment3.services.dtos.product.responses.UserListResponse;
import java.util.*;

public interface UserRepository extends JpaRepository<User, Integer> {
    @Query(value = "Select u from User u LIKE %:query%")
    List<User> search(String query);

    // select the users with a phone not null
    @Query(value = "Select u from User u WHERE phone IS NOT NULL")
    List<User> findByPhoneNotNull();
}