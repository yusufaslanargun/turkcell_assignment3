package pair7.assignment3.services.concrete;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import pair7.assignment3.entities.Category;
import pair7.assignment3.repositories.abstracts.CategoryRepository;
import pair7.assignment3.services.abstracts.CategoryService;

import java.util.List;

@AllArgsConstructor
@Service
public class CategoryServiceImpl implements CategoryService {
    private final CategoryRepository categoryRepository;

    @Override
    public List<Category> getAll() {
        return categoryRepository.findAll();
    }
}
