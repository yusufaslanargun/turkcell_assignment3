package pair7.assignment3.services.abstracts;

import pair7.assignment3.services.dtos.product.requests.AddUserRequest;
import pair7.assignment3.services.dtos.product.responses.UserListResponse;

import java.util.List;

public interface UserService {
    void add(AddUserRequest request);
    List<UserListResponse> getAll();
}
