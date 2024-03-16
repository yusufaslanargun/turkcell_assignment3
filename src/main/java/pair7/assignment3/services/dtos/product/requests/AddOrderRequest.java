package pair7.assignment3.services.dtos.product.requests;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;

import java.time.LocalDate;

public class AddOrderRequest {
    @Min(1)
    private Integer user_Id;
    @Min(1)
    private Integer order_details_id;
    @NotNull
    private LocalDate date;
    @NotNull
    private String order_status;
    @Min(value = 0, message = "toplam tutar 0'dan küçük olamaz")
    private Double total_amount;
}
