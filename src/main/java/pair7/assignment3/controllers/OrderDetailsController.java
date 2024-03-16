package pair7.assignment3.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pair7.assignment3.entities.Order;
import pair7.assignment3.entities.OrderDetails;
import pair7.assignment3.services.abstracts.OrderDetailsService;

import java.util.List;

@RestController
@RequestMapping("/api/orderdetails")
public class OrderDetailsController {
    private final OrderDetailsService orderDetailsService;


    public OrderDetailsController(OrderDetailsService orderDetailsService) {
        this.orderDetailsService = orderDetailsService;
    }
    @GetMapping
    public List<OrderDetails> getAll(){
        return orderDetailsService.getAll();
    }
}