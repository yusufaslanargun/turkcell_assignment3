package pair7.assignment3.services.concrete;

import lombok.*;
import org.springframework.stereotype.Service;
import pair7.assignment3.core.exception.types.BusinessException;
import pair7.assignment3.entities.Category;
import pair7.assignment3.entities.Product;
import pair7.assignment3.repositories.abstracts.ProductRepository;
import pair7.assignment3.services.abstracts.ProductService;
import pair7.assignment3.services.dtos.product.requests.AddProductRequest;
import pair7.assignment3.services.dtos.product.responses.ProductListResponse;

import java.util.*;

@AllArgsConstructor
@Service
public class ProductServiceImpl implements ProductService {
    private ProductRepository productRepository;

    @Override
    public void add(AddProductRequest request) {
        productWithSameNameShouldNotExists(request.getName());
        // TODO: Check from db
        // TODO: Auto Mapping
        Product product = new Product();
        product.setName(request.getName());
        product.setPrice(request.getPrice());
        productRepository.save(product);
    }

    @Override
    public List<ProductListResponse> getAll() {
        List<Product> products = productRepository.findAll();
        List<ProductListResponse> response = new ArrayList<>();

        // Beginner Level List Mapping
        for (Product product: products) {
            ProductListResponse dto = new ProductListResponse(
                    product.getId(),
                    product.getName(),
                    product.getPrice());
            response.add(dto);
        }
        // Request - Response (Reply) Pattern
        return response;
    }

    @Override
    public List<ProductListResponse> search(String query) {
    return productRepository.searchDto(query);
    }

    @Override
    public List<Product> price(double price) {
        return productRepository.findByPriceGreaterThan(price);
    }

    private void productWithSameNameShouldNotExists(String name)
    {
        Optional<Product> productWithSameName =
                productRepository.findByName(name);
        if(productWithSameName.isPresent())
            throw new BusinessException("Aynı isimde 2. ürün eklenemez");
    }
}
