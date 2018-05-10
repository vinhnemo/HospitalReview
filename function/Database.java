/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Patients;
import java.sql.*;
import java.io.InputStream;
/**
 *
 * @author user
 */
public class Database {
 
    private String ip;
    private String port;
    private String database;
    private String userName;
    private String password;
    private String connectionString;
    private Connection connection;
    public Database() {
    }

    public Database(String ip, String port, String database, String userName, String password) {
        this.ip = ip;
        this.port = port;
        this.database = database;
        this.userName = userName;
        this.password = password;

        connectionString = "jdbc:mysql://" + ip + ":" + port + "/" + database + "?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false";

    }

    public Database(String userName, String password, String connectionString) {
        this.userName = userName;
        this.password = password;
        this.connectionString = connectionString;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getPort() {
        return port;
    }

    public void setPort(String port) {
        this.port = port;
    }

    public String getDatabase() {
        return database;
    }

    public void setDatabase(String database) {
        this.database = database;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConnectionString() {
        return connectionString;
    }

    public void setConnectionString(String connectionString) {
        this.connectionString = connectionString;
    }
    
    
     public void openConnection() {
        String connectionURL = connectionString;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(connectionURL, userName, password);
            
        } catch (Exception ex) {
            System.out.println(ex.toString());
        }
    }
     
     public void closeConnection() {
        try {
            connection.close();
        } catch (SQLException ex) {
            System.out.println(ex.toString());
        }
     }
     
     
     

    public ResultSet ExecuteQuery(String sql) {
        ResultSet result = null;
        try {
            Statement stmt = connection.createStatement();
            String mysql = sql;

            result = stmt.executeQuery(mysql);
        } catch (Exception ex) {
            System.out.println(ex.toString());
        }

        return result;
    }

    public int ExecuteUpdate(String sql) {
        int result = 0;
        try {
          
            Statement stmt = connection.createStatement();

            String mysql = sql;

            result = stmt.executeUpdate(mysql);
        } catch (Exception ex) {
            System.out.println(ex.toString());
        }

        return result;
    }

    public int ExecuteUpdateBlob(String sql, InputStream inputStream) {

        int result = 0;
        try {
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setBlob(1, inputStream);
                result = statement.executeUpdate();
            
        } catch (Exception ex) {
            System.out.println(ex.toString());
        }
        
        
        return result;
    }

}

