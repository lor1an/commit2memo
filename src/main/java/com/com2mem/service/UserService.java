package com.com2mem.service;

import com.com2mem.model.Usr;

public interface UserService {

    Usr addUser(final Usr user);

    Usr getUserByLogin(final String login);

    Usr getUserById(final Long usrId);

    void editUser(final Usr user);

}
