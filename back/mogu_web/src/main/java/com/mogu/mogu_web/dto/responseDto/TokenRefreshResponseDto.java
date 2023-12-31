package com.mogu.mogu_web.dto.responseDto;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TokenRefreshResponseDto {
    private String accessToken;
    private String refreshToken;
    private String tokenType = "Bearer";

    public TokenRefreshResponseDto(String accessToken, String refreshToken){
        this.accessToken = accessToken;
        this.refreshToken = refreshToken;
    }
}
