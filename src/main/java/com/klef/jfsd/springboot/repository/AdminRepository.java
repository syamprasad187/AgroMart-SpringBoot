package com.klef.jfsd.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Farmer;

import jakarta.transaction.Transactional;

@Repository
public interface AdminRepository extends JpaRepository<Admin, String>
{
   @Query("select a from Admin a where a.username=?1 and a.password=?2")
   public Admin checkadminlogin(String username, String password);
   
   
   @Query("delete from Farmer where email=?1")
   @Modifying
   @Transactional
   public int deletefarmerByEmail(String email);
   
   
    
   
   
}
