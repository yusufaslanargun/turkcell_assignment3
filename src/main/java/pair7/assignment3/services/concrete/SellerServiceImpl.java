package pair7.assignment3.services.concrete;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import pair7.assignment3.services.abstracts.SellerService;
import pair7.assignment3.services.dtos.product.requests.AddSellerRequest;
import pair7.assignment3.services.dtos.product.responses.SellerListResponse;
import pair7.assignment3.repositories.abstracts.SellerRepository;

import java.util.List;
@AllArgsConstructor
@Service
public class SellerServiceImpl implements SellerService {
    private SellerRepository sellerRepository;

    @Override
    public void add(AddSellerRequest request) {

    }

    @Override
    public List<SellerListResponse> getAll() {
        return null;
    }

    @Override
    public List<SellerListResponse> getSellersOfProduct(int productId) {
        return null;
    }
}
