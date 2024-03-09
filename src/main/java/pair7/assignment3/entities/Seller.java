package pair7.assignment3.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.*;

@Table(name = "sellers")
@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Seller {
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private int id;

    @Column(name = "company_name")
    private String companyName;

    @Column(name = "mail_address")
    private String mailAddress;

    @Column(name = "tax_number")
    private String taxNumber;

    @Column(name = "phone_number")
    private String phoneNumber;

    @ManyToMany
    @JoinTable(name = "sellers_products",
    joinColumns = @JoinColumn(name = "sellers_id"),
    inverseJoinColumns = @JoinColumn(name = "products_id"))
    List<Product> productList;
}
