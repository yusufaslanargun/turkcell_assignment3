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

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "user", cascade = CascadeType.ALL)
    private List<Address> addressList;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "user1", cascade = CascadeType.ALL)
    private List<Order> orderList;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "user2", cascade = CascadeType.ALL)
    private List<Review> reviewList;

    @OneToOne(mappedBy = "user")
    @JsonIgnore
    private Cart cart;

    @ManyToMany
    @JoinTable(name = "wishlists_users",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "product_id"))
    List<Product> wishlistProductList;
}
