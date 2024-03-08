package com.galphi.account;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;


public class AccountDAO
{
    private static AccountDAO instance = new AccountDAO();
    private AccountDAO(){}

    public static AccountDAO getInstance()
    {
        return instance;
    }

    public void insert(SqlSession mapper , AccountVO vo)
    {
        mapper.insert("insert",vo);
    }

    public int nickCheck(SqlSession mapper, String nickname)
    {
        return (int) mapper.selectOne("nickCheck",nickname);
    }

    public int IdCheck(SqlSession mapper, String id)
    {
        return (int) mapper.selectOne("idCheck",id);
    }

    public int Login(SqlSession mapper, HashMap<String, String> hmap)
    {
        return (int) mapper.selectOne("login",hmap);
    }

    public String nickanme(SqlSession mapper, HashMap<String, String> hmap)
    {
        return (String) mapper.selectOne("nickname",hmap);
    }
}
