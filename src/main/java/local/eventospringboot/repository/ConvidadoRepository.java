package local.eventospringboot.repository;

import org.springframework.data.repository.CrudRepository;

import local.eventospringboot.models.Convidado;
import local.eventospringboot.models.Evento;

public interface ConvidadoRepository extends CrudRepository<Convidado, String>{
	Iterable<Convidado> findByEvento(Evento evento);
	
	Convidado findByRg(String rg);
}
