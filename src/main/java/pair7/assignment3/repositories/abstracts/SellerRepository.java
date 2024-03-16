package pair7.assignment3.repositories.abstracts;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pair7.assignment3.entities.Seller;

import java.util.List;

public interface SellerRepository extends JpaRepository<Seller, Integer> {
    @Query(value = "Select s from Seller s WHERE mail = :mail")
    Seller findByMail(String mail);
    @Query(value = "Select s from Seller s WHERE phone = :phone")
    Seller findByPhone(String phone);

    @Query(value = "Select s from Seller s WHERE taxNumber = :taxNumber")
    Seller findByTaxNumber(String taxNumber);

//    // select the sellers selling the same product
//    @Query("SELECT s.id FROM Seller s JOIN s.productList p WHERE p.id = :productId")
//    List<Integer> findSellerIdsByProductId(int productId);
}
