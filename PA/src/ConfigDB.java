/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author LENOVO
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConfigDB {
    private static Connection MySQLConfig;

    public static Connection config() throws SQLException {
        try {
            String url = "jdbc:mysql://localhost:3306/db_pa";
            String username = "root";
            String password = "";
            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
            MySQLConfig = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            System.out.println("Koneksi ke Database Gagal" + e.getMessage());
        }
        return MySQLConfig;
    }
}
