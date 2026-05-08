package com.exam.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {
        Connection con = null;
        try {
            // Read from environment variables (Railway)
            String host = System.getenv("MYSQL_HOST");
            String port = System.getenv("MYSQL_PORT");
            String db   = System.getenv("MYSQL_DATABASE");
            String user = System.getenv("MYSQL_USER");
            String pass = System.getenv("MYSQL_PASSWORD");

            // Fallback to local if env not set
            if(host == null) {
                host = "localhost";
                port = "3306";
                db   = "examdb";
                user = "root";
                pass = "14581"; // your local password
            }

            String url = "jdbc:mysql://" + host + ":" 
                       + port + "/" + db 
                       + "?useSSL=false&allowPublicKeyRetrieval=true";

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, pass);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}