/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBContext;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author admin
 */
public class DBContext implements Serializable{
    public static Connection makeConnection() throws ClassNotFoundException, SQLException{
        //1. Load Driver
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        //2. Create Connection String
        String url="jdbc:sqlserver:"
                + "//localhost:1433"
                + ";databaseName=Volunteerisms8;encrypt=true;trustServerCertificate=true";
        //3. Open Connection
        Connection con=DriverManager.getConnection(url,"sa","sa");
        return con;
    }
     public static void main(String[] args){
        try{
            new DBContext().makeConnection();
            System.out.println("Ket noi thanh cong");
        } catch(Exception e){
            System.out.println("Ket noi that bai"+e.getLocalizedMessage()+" "+e.getMessage());
        }
    }
}
