package com.com2mem.security;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.com2mem.common.model.User;
import com.com2mem.common.model.UserRole;
import com.com2mem.repository.ClientRepository;

@Service("userDetailsService")
public class C2MUserDetailsService implements UserDetailsService {

    @Autowired
    ClientRepository clientRepository;

    @Transactional(readOnly = true)
    @Override
    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException {
        User user = clientRepository.findByUsername(username).get(0);
        List<GrantedAuthority> authorities = buildUserAuthority(user
                .getUserRole());

        return buildUserForAuthentication(user, authorities);
    }

    private C2MUser buildUserForAuthentication(User user,
            List<GrantedAuthority> authorities) {
        return new C2MUser(user.getUsername(), user.getPassword(),
                user.isEnabled(), true, true, true, authorities,
                user.getUserId());
    }

    private List<GrantedAuthority> buildUserAuthority(Set<UserRole> userRoles) {
        Set<GrantedAuthority> setAuths = new HashSet<GrantedAuthority>();

        for (UserRole userRole : userRoles) {
            setAuths.add(new SimpleGrantedAuthority(userRole.getRole().name()));
        }

        List<GrantedAuthority> Result = new ArrayList<GrantedAuthority>(
                setAuths);

        return Result;
    }

}
