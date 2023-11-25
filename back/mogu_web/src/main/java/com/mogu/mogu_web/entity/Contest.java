package com.mogu.mogu_web.entity;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Contest {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name", length = 100)
    private String name;

    @Column(name = "category", length = 100)
    private String category;

    @Column(name = "end_date")
    private LocalDateTime endDate;

    @Column(name = "url")
    private String url;

    @Column(name = "img_url")
    private String imgUrl;

}
