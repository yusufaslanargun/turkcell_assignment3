package pair7.assignment3.services.dtos.product.requests;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class AddReviewRequest {

    @NotNull
    private int rating;
    @Min(1)
    private int user_id;
    @Min(1)
    private int product_id;
}
