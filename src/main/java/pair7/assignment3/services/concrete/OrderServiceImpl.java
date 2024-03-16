package pair7.assignment3.services.concrete;

import pair7.assignment3.entities.Order;
import pair7.assignment3.repositories.abstracts.OrderRepository;
import pair7.assignment3.services.abstracts.OrderService;
import pair7.assignment3.services.dtos.product.requests.AddOrderRequest;

import java.util.List;

public class OrderServiceImpl implements OrderService {
    private final OrderRepository orderRepository;

    public OrderServiceImpl(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    @Override
    public List<Order> getAll() {
        return orderRepository.findAll();
    }

    @Override
    public void add(AddOrderRequest request) {

    }

}
