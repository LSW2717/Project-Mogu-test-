package com.mogu.mogu_web.service;

import com.mogu.mogu_web.entity.Contest;
import com.mogu.mogu_web.repository.ContestRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class ContestService {
    private final ContestRepository contestRepository;

    @Transactional
    public void saveContest(Contest contest){
        contestRepository.save(contest);
    }

    public List<Contest> getContests(){
        return contestRepository.findAll();
    }


}
