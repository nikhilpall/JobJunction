
package com.nikhil.connection;


import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

public class DbConnection {
    public static Connection con;
    public static Connection getConnection(){
        String jdbc_url=null, username=null, password=null;
        try{
            InputStream is = DbConnection.class.getResourceAsStream("db.properties");
            Properties p = new Properties();
            p.load(is);
            
            jdbc_url=p.getProperty("jdbc-url");
            username=p.getProperty("username");
            password=p.getProperty("password");
        }
        catch(IOException e){
            e.getMessage();
        }
        try{
//            Class.forName("com.mysql.jdbc.Driver");
//            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "root");

            MysqlDataSource ds = new MysqlDataSource();
            
            ds.setURL(jdbc_url);
            ds.setUser(username);
            ds.setPassword(password);
            
            con = ds.getConnection();
        }
        catch(SQLException e){
            e.getMessage();
        }
        return con;
    }
}
