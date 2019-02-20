package art.nn.ru.Ex.repos;

import art.nn.ru.Ex.domain.Message;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface MessageRepo extends CrudRepository<Message, Integer> {

    List<Message> findByName(String name);
}
