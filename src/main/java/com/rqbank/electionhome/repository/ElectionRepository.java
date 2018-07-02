package com.rqbank.electionhome.repository;

import com.rqbank.eelection.domain.Election;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @auther Behnam Safari
 * date 6/13/18.
 * description
 */
@Repository
public interface ElectionRepository extends JpaRepository<Election,Integer> {
    List<Election> findByIsActive(String isActive);
}
