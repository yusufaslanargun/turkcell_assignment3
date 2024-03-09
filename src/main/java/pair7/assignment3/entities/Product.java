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
    private int price;

    @Column(name = "stock")
    private int stock;

    @ManyToMany(mappedBy = "products_id")
    @JsonIgnore
    private Category category;

    @ManyToMany(mappedBy = "products_id")
    @JsonIgnore
    private Seller seller;

    @ManyToMany(mappedBy = "products_id")
    @JsonIgnore
    private Cart cart;

    @OneToMany(mappedBy = "discounts")
    @JsonIgnore
    private List<Discount> discountList;

    @OneToMany(mappedBy = "reviews")
    @JsonIgnore
    private List<Review> reviewList;
}
