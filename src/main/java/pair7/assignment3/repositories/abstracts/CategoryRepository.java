package pair7.assignment3.repositories.abstracts;

import org.springframework.data.jpa.repository.JpaRepository;
import pair7.assignment3.entities.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer>
{
}
