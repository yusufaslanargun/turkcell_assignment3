package pair7.assignment3.controllers;

import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pair7.assignment3.entities.Order;
import pair7.assignment3.services.abstracts.OrderService;
import pair7.assignment3.services.dtos.product.requests.AddOrderRequest;
//import pair7.assignment3.services.dtos.product.responses.OrderListResponse;

import java.util.List;

@RestController
@RequestMapping("/api/orders")

public class OrdersController {
    @Autowired
    private final OrderService orderService;

    public OrdersController(OrderService orderService) {
        this.orderService = orderService;
    }
    public void add(@RequestBody @Valid AddOrderRequest request) {
        orderService.add(request);
    }
    @GetMapping
    public List<Order> getAll(){
        return orderService.getAll();
    }
}

