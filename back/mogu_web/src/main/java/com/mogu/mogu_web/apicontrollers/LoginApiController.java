package com.mogu.mogu_web.apicontrollers;

import com.mogu.mogu_web.dto.requestDto.LoginRequestDto;
import com.mogu.mogu_web.dto.requestDto.TokenRefreshRequestDto;
import com.mogu.mogu_web.dto.responseDto.JwtResponseDto;
import com.mogu.mogu_web.dto.responseDto.TokenRefreshResponseDto;
import com.mogu.mogu_web.entity.RefreshToken;
import com.mogu.mogu_web.security.jwt.JwtUtils;
import com.mogu.mogu_web.security.jwt.TokenRefreshException;
import com.mogu.mogu_web.security.services.RefreshTokenService;
import com.mogu.mogu_web.service.UserService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/auth")
public class LoginApiController {
    private final UserService userService;
    private final RefreshTokenService refreshTokenService;
    private final JwtUtils jwtUtils;

    @PostMapping("/signin")
    public ResponseEntity<?> authenticateUser(@Valid @RequestBody LoginRequestDto loginRequest) {
        JwtResponseDto jwtResponse = userService.authenticateUser(loginRequest);
        return ResponseEntity.ok(jwtResponse);
    }
    @PostMapping("/refreshtoken")
    public ResponseEntity<?> refreshtoken(@Valid @RequestBody TokenRefreshRequestDto request) {
        String requestRefreshToken = request.getRefreshToken();

        return refreshTokenService.findByToken(requestRefreshToken)
                .map(refreshTokenService::verifyExpiration)
                .map(RefreshToken::getUser)
                .map(user -> {
                    String token = jwtUtils.generateTokenFromUsername(user.getUsername());
                    return ResponseEntity.ok(new TokenRefreshResponseDto(token, requestRefreshToken));
                })
                .orElseThrow(() -> new TokenRefreshException(requestRefreshToken,
                        "Refresh token is not in database!"));
    }


}
