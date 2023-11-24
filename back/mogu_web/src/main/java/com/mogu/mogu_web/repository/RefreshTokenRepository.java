package com.mogu.mogu_web.repository;

import com.mogu.mogu_web.entity.RefreshToken;
import com.mogu.mogu_web.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface RefreshTokenRepository extends JpaRepository<RefreshToken, Long> {
    Optional<RefreshToken> findByToken(String token);
    Optional<RefreshToken> findByUserId(Long user_id);

    @Modifying
    int deleteByUser(User user);
}
