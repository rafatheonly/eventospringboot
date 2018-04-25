package local.demo.repository;

import org.springframework.data.repository.CrudRepository;
import local.demo.models.Evento;

public interface EventoRepository extends CrudRepository<Evento, String> {
	Evento findByCodigo(long codigo);
}
