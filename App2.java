package com.back;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class App2 
{
    public static void main( String[] args )
    {
        System.out.println( "Connection Started..." );
        Configuration cfg = new Configuration();
        cfg.configure("hibernate.cfg.xml");
        SessionFactory factory = cfg.buildSessionFactory();
        
        Student st = new Student(1,"Moiz","Kashmore");
        Student st2 = new Student(2,"Jawad","Hyderabad");

        
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        session.save(st);
        session.save(st2);
        tx.commit();
        session.close();
 
    }
    
}
