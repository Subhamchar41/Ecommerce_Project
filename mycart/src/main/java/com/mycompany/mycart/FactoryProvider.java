package com.mycompany.mycart;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
     private static SessionFactory factory;
      public static SessionFactory getFactory() {
        try {

            if (factory == null) {
                factory = new Configuration().configure("src/main/Resources/hibernate.cfg.xml").buildSessionFactory();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return factory;
    }
}
