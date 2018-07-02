package com.rqbank.electionhome.service.impl;

import com.rqbank.eelection.domain.Election;
import com.rqbank.electionhome.repository.ElectionRepository;
import com.rqbank.electionhome.service.ElectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ElectionServiceImpl implements ElectionService {
    @Autowired
    ElectionRepository electionRepository;

    @Override
    public List<Election> getAllActives() {
        return electionRepository.findByIsActive("true");
    }
}
