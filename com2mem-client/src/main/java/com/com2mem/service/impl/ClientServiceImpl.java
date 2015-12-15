package com.com2mem.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.com2mem.common.model.UserRole;
import com.com2mem.model.Client;
import com.com2mem.repository.ClientRepository;
import com.com2mem.service.ClientService;
import com.google.common.collect.Sets;

import static com.com2mem.common.model.Role.ROLE_USER;

@Service(value = "clientService")
public class ClientServiceImpl implements ClientService {

    @Autowired
    ClientRepository clientRepository;

    @Autowired
    BCryptPasswordEncoder encoder;

    @Override
    public Client addUser(final Client client) {
        client.setPassword(encoder.encode(client.getPassword()));
        client.setUserRole(Sets.newHashSet(new UserRole(client, ROLE_USER)));
        client.setEnabled(true);
        return clientRepository.save(client);
    }

    @Override
    public Client getUserByUsername(final String username) {
        List<Client> usrList = clientRepository.findByUsername(username);
        Client client = usrList == null ? null : usrList.get(0);
        return client;
    }

    @Override
    public Client getUserById(final Long usrId) {
        return clientRepository.findOne(usrId);
    }

    @Override
    public void updateUser(final Client client) {
        clientRepository.save(client);
    }

    @Override
    public List<Client> getAllUsers() {
        return (List<Client>) clientRepository.findAll();
    }

    @Override
    public boolean isUserExist(final Client client) {
        // if (user.getUsrId() != null) {
        // return getUserById(user.getUsrId()) != null;
        // }
        return false;
    }

    @Override
    public void saveUser(final Client client) {
        clientRepository.save(client);
    }

    @Override
    public void deleteUserById(final Long id) {
        clientRepository.delete(id);
    }

    @Override
    public void deleteAllUsers() {
        clientRepository.deleteAll();
    }

    @Override
    public boolean checkEmail(String email) {
        return clientRepository.countByEmail(email) > 0;
    }

    @Override
    public boolean checkUsername(String username) {
        return clientRepository.countByUsername(username) > 0;
    }

}
