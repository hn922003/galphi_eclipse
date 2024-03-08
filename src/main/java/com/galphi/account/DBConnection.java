package com.galphi.account;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection
{
    // mysql에 연결하는 Connection을 return 하는 메소드
    public static Connection getOracleConnection()
    {
        Connection conn = null;
        try
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String url = "jdbc:oracle:thin:@localhost:1521:xe";
            conn = DriverManager.getConnection(url,"tjoeunit","0000");
        }
        catch (ClassNotFoundException e)
        {
            System.out.println("드라이버 클래스가 없거나 읽어올 수 없습니다.");
        }
        catch (SQLException e)
        {
            System.out.println("데이터베이스 접속 정보가 없습니다.");
        }
        return conn;
    }

    public static void close(Connection conn)
    {
        if (conn != null)
        {
            try
            {
                conn.close();
            }
            catch (SQLException e)
            {
                e.printStackTrace();
            }
        }
    }
}
