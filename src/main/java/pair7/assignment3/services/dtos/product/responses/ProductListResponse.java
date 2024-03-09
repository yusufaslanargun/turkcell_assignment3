package pair7.assignment3.services.dtos.product.responses;

import jakarta.validation.constraints.*;
import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ProductListResponse {
    private int id;
    private String name;
    private double price;
}
