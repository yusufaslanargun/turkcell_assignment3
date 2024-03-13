package pair7.assignment3.repositories.abstracts;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pair7.assignment3.entities.*;
import pair7.assignment3.services.dtos.product.responses.ProductListResponse;
import java.util.*;

public interface ProductRepository extends JpaRepository<Product, Integer> {
    // Native Query => Saf SQL
    //@Query(value="Select * from products where LOWER(name) LIKE %:query% ", nativeQuery = true)

    // JPQL => JPA + SQL
    @Query(value = "Select p from Product p WHERE LOWER(p.name) LIKE %:query%")
    List<Product> search(String query);

    @Query(value = "Select new pair7.assignment3.services.dtos.product.responses.ProductListResponse" +
            "(p.id, p.name, p.price)" + " WHERE lower(p.name) LIKE %:query%")
    List<ProductListResponse> searchDto(String query);


    List<Product> findByPriceGreaterThan(double price);
    Optional<Product> findByName(String name);
}
