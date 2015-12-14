package com.com2mem.repository;

import org.springframework.transaction.annotation.Transactional;

import com.com2mem.common.repository.UserRepository;
import com.com2mem.model.Client;

@Transactional
public interface ClientRepository extends UserRepository<Client> {

}
