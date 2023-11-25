package com.mogu.mogu_web.dto.responseDto;

import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Getter
@NoArgsConstructor
public class ContestResponseDto {
    private Long id;
    private String name;
    private String category;
    private LocalDateTime endDate;
    private String url;
    private String imgUrl;

    // 모든 필드를 인자로 받는 생성자
    public ContestResponseDto(Long id, String name, String category, LocalDateTime endDate, String url, String imgUrl) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.endDate = endDate;
        this.url = url;
        this.imgUrl = imgUrl;
    }

}
