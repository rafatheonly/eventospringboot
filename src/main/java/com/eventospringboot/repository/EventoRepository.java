package com.eventospringboot.repository;

import org.springframework.data.repository.CrudRepository;

import com.eventospringboot.models.Evento;

public interface EventoRepository extends CrudRepository<Evento, String> {
	Evento findByCodigo(long codigo);
}
