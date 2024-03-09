package pair7.assignment3.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name = "reviews")
@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Review {
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private int id;

    @Column(name = "review_text")
    private String reviewText;

    @Column(name = "rating")
    private int rating;

    @ManyToOne
    @JoinColumn(name = "user_id")
    @JsonIgnore
    private User user2;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product2;
}
