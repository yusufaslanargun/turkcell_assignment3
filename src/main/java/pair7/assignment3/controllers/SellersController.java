package pair7.assignment3.controllers;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import pair7.assignment3.services.abstracts.SellerService;
import pair7.assignment3.services.dtos.product.requests.AddSellerRequest;
import pair7.assignment3.services.dtos.product.responses.SellerListResponse;

import java.util.List;

@RestController
@RequestMapping("/api/sellers")
public class SellersController {
    @Autowired
    private SellerService sellerService;

    public SellersController(SellerService sellerService) {
        this.sellerService = sellerService;
    }

    @PostMapping
    public void add(@RequestBody @Valid AddSellerRequest request) {
        sellerService.add(request);
    }

    @GetMapping("/search")
    public List<SellerListResponse> get() {
        return sellerService.getAll();
    }

    @GetMapping("sellersOf/{productId}")
    public List<SellerListResponse> getSellersOfProduct(@RequestParam int productId) {
        return sellerService.getSellersOfProduct(productId);
    }

}
