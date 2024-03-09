package pair7.assignment3.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Table(name = "discounts")
@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Discount {
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "min_price_amount")
    private double minPriceAmount;

    @Column(name = "description")
    private String description;

    @ManyToOne()
    @JoinColumn(name = "product_id")
    private Product product1;
}
