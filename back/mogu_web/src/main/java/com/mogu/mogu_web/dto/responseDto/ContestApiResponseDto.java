package com.mogu.mogu_web.dto.responseDto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
public class ContestApiResponseDto <T> {
    private T data;
}