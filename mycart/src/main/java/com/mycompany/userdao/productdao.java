/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.userdao;

import com.mycompany.entity.product;
import java.util.List;
import java.util.Locale;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;


public class productdao {
   
     private SessionFactory factory;
     
      public productdao(SessionFactory factory){
        this.factory=factory;
    }
      public boolean saveProduct(product product){
          boolean f=false;
          try{
              Session session = this.factory.openSession();
               Transaction tx = session.beginTransaction();
               session.save(product);
               tx.commit();
               session.close();
            f=true; 
              
          } catch (Exception e){
              e.printStackTrace();
              f= false;
          }
          return f;
      }
      
      public List<product> getAllProducts(){
          Session p = this.factory.openSession();
         Query query = p.createQuery("from Product");
         List<product> list= query.list();
         return list;
      }
}
