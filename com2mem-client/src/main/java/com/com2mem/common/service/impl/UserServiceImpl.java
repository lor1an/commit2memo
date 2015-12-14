package com.com2mem.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.com2mem.common.model.User;
import com.com2mem.common.model.UserRole;
import com.com2mem.common.repository.UserRepository;
import com.com2mem.common.service.UserService;
import com.google.common.collect.Sets;

import static com.com2mem.model.Role.ROLE_USER;

@Service(value = "userService")
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	UserRepository userRepository;

	@Autowired
	BCryptPasswordEncoder encoder;

	@Override
	public User addUser(final User user) {
		user.setPassword(encoder.encode(user.getPassword()));
		user.setUserRole(Sets.newHashSet(new UserRole(user, ROLE_USER)));
		user.setEnabled(true);
		return userRepository.save(user);
	}

	@Override
	public User getUserByUsername(final String username) {
		List<User> usrList = userRepository.findByUsername(username);
		User user = usrList == null ? null : usrList.get(0);
		return user;
	}

	@Override
	public User getUserById(final Long usrId) {
		return userRepository.findOne(usrId);
	}

	@Override
	public void updateUser(final User user) {
		userRepository.save(user);
	}

	@Override
	public List<User> getAllUsers() {
		return (List<User>) userRepository.findAll();
	}

	@Override
	public boolean isUserExist(final User user) {
		// if (user.getUsrId() != null) {
		// return getUserById(user.getUsrId()) != null;
		// }
		return false;
	}

	@Override
	public void saveUser(final User user) {
		userRepository.save(user);
	}

	@Override
	public void deleteUserById(final Long id) {
		userRepository.delete(id);
	}

	@Override
	public void deleteAllUsers() {
		userRepository.deleteAll();
	}

}
