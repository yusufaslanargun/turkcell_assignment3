package pair7.assignment3.services.dtos.product.responses;

import jakarta.validation.constraints.*;
import lombok.*;


@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SellerListResponse {
    private String company_name;
    private String email;
    private String phone;
}
