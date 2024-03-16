package pair7.assignment3.services.dtos.product.responses;

public class ReviewListResponse {
    private int id;
    private int rating;
    private int user_id;
    private int product_id;
public ReviewListResponse(int id,int rating,int user_id,int product_id){
this.id=id;
this.product_id=product_id;
this.user_id=user_id;
this.rating=rating;
}
}