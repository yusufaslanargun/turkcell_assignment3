package pair7.assignment3.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
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

    @Column(name = "mail")
    private String mailAddress;

    @Column(name = "tax_number")
    private String taxNumber;

    @Column(name = "phone")
    private String phoneNumber;

    @ManyToMany
    @JoinTable(name = "sellers_products",
    joinColumns = @JoinColumn(name = "seller_id"),
    inverseJoinColumns = @JoinColumn(name = "product_id"))
    List<Product> productList;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "seller", cascade = CascadeType.ALL)
    private List<Address> addressList;
}
