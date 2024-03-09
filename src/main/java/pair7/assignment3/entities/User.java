package pair7.assignment3.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.*;

@Table(name = "users")
@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "surname")
    private String surname;

    @Column(name = "mail")
    private String mail;

    @Column(name = "phone")
    private String phone;

    @OneToMany(mappedBy = "address")
    @JsonIgnore
    private List<Address> addressList;

    @OneToMany(mappedBy = "orders")
    @JsonIgnore
    private List<Order> orderList;

    @OneToMany(mappedBy = "reviews")
    @JsonIgnore
    private List<Review> reviewList;

    @OneToMany(mappedBy = "shopping_carts")
    @JsonIgnore
    private List<Cart> cartList;
}
