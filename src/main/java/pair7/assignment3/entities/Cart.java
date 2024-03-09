package pair7.assignment3.entities;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Table(name = "shopping_carts")
@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private int id;

    @Column(name = "total_amount")
    private int totalAmount;

    @OneToOne(mappedBy = "user_id")
    private User user;

    @ManyToMany
    @JoinTable(name = "shopping_carts_products",
            joinColumns = @JoinColumn(name = "shopping_carts_id"),
            inverseJoinColumns = @JoinColumn(name = "products_id"))
    List<Product> productList;
}
