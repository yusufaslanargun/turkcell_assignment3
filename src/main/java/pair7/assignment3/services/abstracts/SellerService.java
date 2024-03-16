package pair7.assignment3.services.abstracts;

import pair7.assignment3.entities.Seller;
import pair7.assignment3.services.dtos.product.requests.*;
import pair7.assignment3.services.dtos.product.responses.SellerListResponse;


import java.util.List;
public interface SellerService {
    void add(AddSellerRequest request);
    List<SellerListResponse> getAll();
    List<SellerListResponse> getSellersOfProduct(int productId);
}