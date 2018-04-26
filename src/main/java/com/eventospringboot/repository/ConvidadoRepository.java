package com.eventospringboot.repository;

import org.springframework.data.repository.CrudRepository;

import com.eventospringboot.models.Convidado;
import com.eventospringboot.models.Evento;

public interface ConvidadoRepository extends CrudRepository<Convidado, String> {
	Iterable<Convidado> findByEvento(Evento evento);

	Convidado findByRg(String rg);
}