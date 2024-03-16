package pair7.assignment3.controllers;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import pair7.assignment3.services.abstracts.UserService;
import pair7.assignment3.services.dtos.product.requests.AddUserRequest;
import pair7.assignment3.services.dtos.product.responses.UserListResponse;

import java.util.List;

@RestController
@RequestMapping("/api/users")
public class UsersController {
    public UsersController(UserService userService) {
        this.userService = userService;
    }

    @Autowired
    private UserService userService;

    @PostMapping
    public void add(@RequestBody @Valid AddUserRequest request) {
        userService.add(request);
    }

    @GetMapping("/search")
    public List<UserListResponse> get() {
        return userService.getAll();
    }
}
