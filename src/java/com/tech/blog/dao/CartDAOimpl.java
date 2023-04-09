package com.tech.blog.dao;

import com.tech.blog.entities.Cart;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class CartDAOimpl implements CartDAO
{
    private Connection conn;
    public CartDAOimpl(Connection conn)
    {
        this.conn = conn;
    }
    
    public boolean addCart(Cart c) 
    {
        boolean f = false;
        try 
        {
          String sql = "insert into cart(bid , uid , book_name , author , quantity ) values(?,?,?,?,?)";
          PreparedStatement ps = conn.prepareStatement(sql);
          ps.setInt(1,c.getBid());
          ps.setInt(2,c.getUid());
          ps.setString(3,c.getBook_name());
          ps.setString(4,c.getAuthor());
          ps.setInt(5,c.getQuantity());
          
          int i = ps.executeUpdate();
          if(i == 1)
          {
              f = true;
          }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    
}
