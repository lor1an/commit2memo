package com.com2mem.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.com2mem.model.User;

@Repository("userRepository")
@Transactional
public interface UserRepository extends CrudRepository<User, Long> {
	
    public List<User> findByUsername(String username);
    
}
