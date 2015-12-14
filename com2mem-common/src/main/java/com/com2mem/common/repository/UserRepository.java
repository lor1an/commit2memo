package com.com2mem.common.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.NoRepositoryBean;

import com.com2mem.common.model.User;

@NoRepositoryBean
public interface UserRepository<T extends User> extends CrudRepository<T, Long> {
	
    public List<T> findByUsername(String username);
    
}
