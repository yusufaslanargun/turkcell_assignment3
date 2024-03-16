package pair7.assignment3.services.dtos.product.responses;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
public class OrderListResponse {
    private Integer id;
    private Integer user_Id;
    private Integer order_details_id;
    private LocalDate date;
    private String order_status;
    private Double total_amount;
    public OrderListResponse(int id,int user_Id,int order_details_id,String order_status,double total_amount){
        this.id=id;
        this.user_Id=user_Id;
        this.order_details_id=order_details_id;
        this.order_status=order_status;
        this.total_amount=total_amount;
    }
}

