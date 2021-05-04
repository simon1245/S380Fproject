package ouhk.groupproject.service;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import ouhk.groupproject.dao.WebUserRepository;
import ouhk.groupproject.model.UserRole;
import ouhk.groupproject.model.WebUser;

@Service
public class WebUserService implements UserDetailsService {
    @Resource
    WebUserRepository webUserRepo;

    @Override
    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException {
        WebUser webUser = webUserRepo.findById(username).orElse(null);
        if (webUser == null) {
            throw new UsernameNotFoundException("User '" + username + "' not found.");
        }
        List<GrantedAuthority> authorities = new ArrayList<>();
        for (UserRole role : webUser.getRoles()) {
            authorities.add(new SimpleGrantedAuthority(role.getRole()));
        }
        return new User(webUser.getUsername(), webUser.getPassword(), authorities);
    }
}