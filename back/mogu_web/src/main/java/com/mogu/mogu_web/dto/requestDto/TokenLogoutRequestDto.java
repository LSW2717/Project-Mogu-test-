package com.mogu.mogu_web.dto.requestDto;

import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TokenLogoutRequestDto {
    @NotNull
    private Long id;
}
