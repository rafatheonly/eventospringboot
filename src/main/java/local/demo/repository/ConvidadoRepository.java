package local.demo.repository;

import org.springframework.data.repository.CrudRepository;

import local.demo.models.Convidado;
import local.demo.models.Evento;

public interface ConvidadoRepository extends CrudRepository<Convidado, String>{
	Iterable<Convidado> findByEvento(Evento evento);
	
	Convidado findByRg(String rg);
}
