package pair7.assignment3.services.dtos.product.requests;

import jakarta.validation.constraints.*;
import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class AddSellerRequest {
    @NotBlank(message = "şirket ismi boş olamaz.")
    private String company_name;
}
