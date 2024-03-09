package pair7.assignment3.services.abstracts;

import pair7.assignment3.entities.Product;
import pair7.assignment3.services.dtos.product.requests.AddProductRequest;
import pair7.assignment3.services.dtos.product.responses.ProductListResponse;

import java.util.List;

public interface ProductService {
    void add(AddProductRequest request);
    List<ProductListResponse> getAll();
    List<ProductListResponse> search(String query);
    List<Product> price(double price);
}
