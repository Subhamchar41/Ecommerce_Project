/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.userdao;

import com.mycompany.entity.User;
import javax.persistence.Query;
import javax.persistence.TemporalType;
import org.hibernate.Session;
import org.hibernate.SessionFactory;


public class userdao {
    private SessionFactory factory;
    
    public userdao(SessionFactory factory){
        this.factory=factory;
    }
    
    public User getUserbyEmailAndPassword(String email,String password){
        User user=null;
        try{
            
            String query="from User where userEmail=: e and userPassword=: p ";
            Session session=this.factory.openSession();
            Query s=session.createQuery(query);
            s.setParameter("e",email);
            s.setParameter("p",password);
            user= (User)s.uniqueResult();
            
            session.close();
            
        }
        catch (Exception e){
                e.printStackTrace();
            }
        
        return user;
    }
    
}
