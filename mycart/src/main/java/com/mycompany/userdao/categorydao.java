/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.userdao;

import com.mycompany.entity.category;
import java.util.List;
import java.util.Locale.Category;
import javax.persistence.Query;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author CHAR
 */
public class categorydao {
     private SessionFactory factory;
     
     public categorydao(SessionFactory factory){
        this.factory=factory;
    }
     
     public int saveCategory(Category cat){
               Session session = this.factory.openSession();
               Transaction tx = session.beginTransaction();
               int catId = (int) session.save(cat);
               tx.commit();
               session.close();
               return catId;
     }
     
     public List<Category> getCategories(){
         Session s = this.factory.openSession();
         Query query = s.createQuery("from Category");
         List<Category> list= query.list();
         return list;
     }
     
     public Category getCategoryById(int cid){
         Category cat = null;
         try{
             
             Session session = this.factory.openSession();
             cat= session.get(category, cid);           
         } 
         catch (Exception e){
             e.printStackTrace();
         }
         return cat;
     }
    
  
}
