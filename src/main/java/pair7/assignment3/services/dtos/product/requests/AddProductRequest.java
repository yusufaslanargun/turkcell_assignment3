package pair7.assignment3.services.dtos.product.requests;

import jakarta.validation.constraints.*;
import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class AddProductRequest {
    //TODO: Move to constants & add multi language
    @NotBlank(message = "Ürün ismi boş olamaz.")
    @Size(min = 3, max = 25, message = "Ürün ismi 3 ile 25 karakter arasında olmalıdır.")
    private String name;
    @Min(0)
    private double price;
    @Min(0)
    private int stock;
    @Min(1)
    private int categoryId;
}
