package com.mogu.mogu_web.apicontrollers;

import com.mogu.mogu_web.entity.Contest;
import com.mogu.mogu_web.service.ContestService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class ContestController {
    private final ContestService contestService;


//    @GetMapping
//    public ResponseEntity<List<ContestDto>> getAllContests() {
//        List<Contest> contests = contestService.getAllContests();
//        List<ContestDto> contestDtos = contests.stream()
//                .map(contest -> new ContestDto(contest.getId(), contest.getName(), ...))
//            .collect(Collectors.toList());
//        return ResponseEntity.ok(contestDtos);
//    }
}
