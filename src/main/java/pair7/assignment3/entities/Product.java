package pair7.assignment3.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Table(name = "products")
@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "price")
    private double price;

    @Column(name = "stock")
    private long stock;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "product1", cascade = CascadeType.ALL)
    private List<Discount> discountList;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "product2", cascade = CascadeType.ALL)
    private List<Review> reviewList;

    @ManyToMany
    @JoinTable(name = "wishlists_users",
            joinColumns = @JoinColumn(name = "product_id"),
            inverseJoinColumns = @JoinColumn(name = "user_id"))
    private List<User> wishlistUserList;

    @ManyToMany
    @JoinTable(name = "shopping_carts_products",
            joinColumns = @JoinColumn(name = "product_id"),
            inverseJoinColumns = @JoinColumn(name = "shopping_cart_id"))
    private List<Cart> cartList;

    @ManyToMany
    @JoinTable(name = "products_categories",
            joinColumns = @JoinColumn(name = "product_id"),
            inverseJoinColumns = @JoinColumn(name = "category_id"))
    private List<Category> categoryList;

    @ManyToMany
    @JoinTable(name = "sellers_products",
            joinColumns = @JoinColumn(name = "product_id"),
            inverseJoinColumns = @JoinColumn(name = "seller_id"))
    private List<Seller> sellerList;

}
