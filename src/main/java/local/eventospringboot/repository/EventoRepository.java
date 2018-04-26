package local.eventospringboot.repository;

import org.springframework.data.repository.CrudRepository;

import local.eventospringboot.models.Evento;

public interface EventoRepository extends CrudRepository<Evento, String> {
	Evento findByCodigo(long codigo);
}