package com.com2mem.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.com2mem.model.Usr;

@Repository("userRepository")
@Transactional
public interface UsrRepository extends CrudRepository<Usr, Long> {
	
    public List<Usr> findByLogin(String login);
    
}
