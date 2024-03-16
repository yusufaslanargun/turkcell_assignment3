package pair7.assignment3.services.abstracts;

import org.springframework.stereotype.Service;
import pair7.assignment3.entities.Order;
import pair7.assignment3.services.dtos.product.requests.AddOrderRequest;


import java.util.List;
@Service
public interface OrderService {
    List<Order> getAll();
    void add(AddOrderRequest request);

}
