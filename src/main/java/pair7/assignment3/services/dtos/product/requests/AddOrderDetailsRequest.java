package pair7.assignment3.services.dtos.product.requests;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;

public class AddOrderDetailsRequest {
    @NotNull
    private String payment_method;
    @Min(1)
    private Integer order_id;
}
