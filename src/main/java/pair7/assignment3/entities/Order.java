package pair7.assignment3.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.*;

@Table(name = "orders")
@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private int id;

    @Temporal(TemporalType.DATE)
    @Column(name = "date")
    private Date date;

    @Column(name = "total_amount")
    private double totalAmount;

    @Column(name = "order_status")
    private boolean orderStatus;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user1;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "order_details_id")
    private OrderDetails orderDetails;

}
