package com.rqbank.electionhome.service;

import com.rqbank.eelection.domain.Election;

import java.util.List;

public interface ElectionService {
    List<Election> getAllActives();
}
