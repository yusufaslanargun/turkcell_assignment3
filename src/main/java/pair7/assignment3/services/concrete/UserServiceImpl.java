package pair7.assignment3.services.concrete;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import pair7.assignment3.repositories.abstracts.UserRepository;
import pair7.assignment3.services.abstracts.UserService;
import pair7.assignment3.services.dtos.product.requests.AddUserRequest;
import pair7.assignment3.services.dtos.product.responses.UserListResponse;

import java.util.List;
@AllArgsConstructor
@Service
public class UserServiceImpl implements UserService {
    private UserRepository userRepository;
    @Override
    public void add(AddUserRequest request) {

    }

    @Override
    public List<UserListResponse> getAll() {
        return null;
    }
}
