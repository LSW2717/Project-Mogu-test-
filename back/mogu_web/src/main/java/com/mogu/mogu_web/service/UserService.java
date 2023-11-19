package com.mogu.mogu_web.service;


import com.mogu.mogu_web.dto.requestDto.LoginRequestDto;
import com.mogu.mogu_web.dto.requestDto.UserRequestDto;
import com.mogu.mogu_web.dto.responseDto.JwtResponseDto;
import com.mogu.mogu_web.entity.ERole;
import com.mogu.mogu_web.entity.RefreshToken;
import com.mogu.mogu_web.entity.Role;
import com.mogu.mogu_web.entity.User;
import com.mogu.mogu_web.repository.RoleRepository;
import com.mogu.mogu_web.repository.UserRepository;
import com.mogu.mogu_web.security.jwt.JwtUtils;
import com.mogu.mogu_web.security.services.RefreshTokenService;
import com.mogu.mogu_web.security.services.UserDetailsImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final PasswordEncoder encoder;
    private final AuthenticationManager authenticationManager;
    private final JwtUtils jwtUtils;
    private final RefreshTokenService refreshTokenService;

    @Transactional
    public void registerNewUser(UserRequestDto userRequestDto) {
        if (userRepository.existsByUsername(userRequestDto.getUsername())) {
            throw new RuntimeException("Error: Username is already taken!");
        }

        if (userRepository.existsByEmail(userRequestDto.getEmail())) {
            throw new RuntimeException("Error: Email is already in use!");
        }

        // Create new user's account
        User user = new User(userRequestDto.getName(),
                userRequestDto.getUsername(),
                encoder.encode(userRequestDto.getPassword()),
                userRequestDto.getEmail());

        Set<String> strRoles = userRequestDto.getRole();
        Set<Role> roles = new HashSet<>();

        if (strRoles == null) {
            Role userRole = roleRepository.findByName(ERole.ROLE_USER)
                    .orElseThrow(() -> new RuntimeException("Error: Role is not found."));
            roles.add(userRole);
        } else {
            strRoles.forEach(role -> {
                switch (role) {
                    case "admin" -> {
                        Role adminRole = roleRepository.findByName(ERole.ROLE_ADMIN)
                                .orElseThrow(() -> new RuntimeException("Error: Role is not found."));
                        roles.add(adminRole);
                    }
                    case "developer" -> {
                        Role developerRole = roleRepository.findByName(ERole.ROLE_DEVELOPER)
                                .orElseThrow(() -> new RuntimeException("Error: Role is not found."));
                        roles.add(developerRole);
                    }
                    case "designer" -> {
                        Role designerRole = roleRepository.findByName(ERole.ROLE_DESIGNER)
                                .orElseThrow(() -> new RuntimeException("Error: Role is not found."));
                        roles.add(designerRole);
                    }
                    default -> {
                        Role userRole = roleRepository.findByName(ERole.ROLE_USER)
                                .orElseThrow(() -> new RuntimeException("Error: Role is not found."));
                        roles.add(userRole);
                    }
                }
            });
        }

        user.setRoles(roles);
        userRepository.save(user);
    }

    public JwtResponseDto authenticateUser(LoginRequestDto loginRequest) {
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(loginRequest.getUsername(), loginRequest.getPassword()));

        SecurityContextHolder.getContext().setAuthentication(authentication);
        String jwt = jwtUtils.generateJwtToken(authentication);

        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
        List<String> roles = userDetails.getAuthorities().stream()
                .map(GrantedAuthority::getAuthority)
                .collect(Collectors.toList());
        RefreshToken refreshToken = refreshTokenService.createRefreshToken(userDetails.getId());


        return new JwtResponseDto(jwt,
                refreshToken.getToken(),
                userDetails.getId(),
                userDetails.getUsername(),
                userDetails.getEmail(),
                roles);
    }
}
