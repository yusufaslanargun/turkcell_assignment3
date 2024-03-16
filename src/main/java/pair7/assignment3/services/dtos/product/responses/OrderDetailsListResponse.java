package pair7.assignment3.services.dtos.product.responses;

import jakarta.validation.constraints.Min;

public class OrderDetailsListResponse {
    private Integer id;
    private String payment_method;

    private Integer order_id;
    public OrderDetailsListResponse(int id,String payment_method,int order_id){
        this.id=id;
        this.order_id=order_id;
        this.payment_method=payment_method;
    }
}
