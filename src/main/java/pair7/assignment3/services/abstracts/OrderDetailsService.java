package pair7.assignment3.services.abstracts;

import org.springframework.stereotype.Service;
import pair7.assignment3.entities.OrderDetails;

import java.util.List;

@Service
public interface OrderDetailsService {
    List<OrderDetails> getAll();
}
