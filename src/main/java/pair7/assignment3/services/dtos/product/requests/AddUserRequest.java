package pair7.assignment3.services.dtos.product.requests;
import jakarta.validation.constraints.*;
import lombok.*;
import pair7.assignment3.entities.Product;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class AddUserRequest {
    @NotBlank(message = "isminiz boş olamaz.")
    private String name;
    @NotBlank(message = "soyisminiz ismi boş olamaz.")
    private String surname;

    private String mail;
    private String phone;

}
