package pair7.assignment3.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name = "addresses")
@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Address {

    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private int id;

    @Column(name = "city")
    private String city;

    @Column(name = "district")
    private String district;

    @Column(name = "postal_code")
    private String postalCode;

    @Column(name = "description")
    private String description;

    @Column(name = "street")
    private String street;

    @Column(name = "no")
    private String no;

    @ManyToOne()
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne()
    @JoinColumn(name = "seller_id")
    private Seller seller;
}
