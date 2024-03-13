package pair7.assignment3.controllers;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import pair7.assignment3.entities.Product;
import pair7.assignment3.services.abstracts.ProductService;
import pair7.assignment3.services.dtos.product.requests.AddProductRequest;
import pair7.assignment3.services.dtos.product.responses.ProductListResponse;

import java.util.List;

@RestController
@RequestMapping("/api/products")
public class ProductsController
{
    @Autowired
    private ProductService productService;

    public ProductsController(ProductService productService) {
        this.productService = productService;
    }

    // DTO => Data Transfer Object
    @PostMapping
    public void add(@RequestBody @Valid AddProductRequest request)
    {
        productService.add(request);
    }
    @GetMapping
    public List<ProductListResponse> get() {
        return productService.getAll();
    }

    @GetMapping("search")
    public List<ProductListResponse> search(@RequestParam String query)
    {
        return productService.search(query);
    }
    @GetMapping("price")
    public List<Product> price(@RequestParam double price)
    {
        return productService.price(price);
    }
}
