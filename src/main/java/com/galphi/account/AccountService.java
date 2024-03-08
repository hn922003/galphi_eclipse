package com.galphi.account;

import com.galphi.mybatis.MySession;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;

public class AccountService
{
    private static AccountService instance = new AccountService();

    private AccountService(){}

    public static AccountService getInstance()
    {
        return instance;
    }


    // 회원가입시 정보를 DB에 저장
    public void insert(AccountVO vo)
    {
        SqlSession mapper = MySession.getSession();
        AccountDAO.getInstance().insert(mapper,vo);

        mapper.commit();
        mapper.close();
    }

    // 회원가입시 닉네임 중복 여부 체크
    public int nickCheck(String nickname)
    {
        SqlSession mapper = MySession.getSession();
        int nick_cnt = AccountDAO.getInstance().nickCheck(mapper,nickname);

        mapper.commit();
        mapper.close();

        return nick_cnt;
    }

    // 회원가입시 ID 중복여부 체크 and 로그인시 ID 존재 여부 확인 ==> SQL 쿼리가 같기때문에 재사용
    public int IdCheck(String id)
    {
        SqlSession mapper = MySession.getSession();
        int id_cnt = AccountDAO.getInstance().IdCheck(mapper,id);

        mapper.commit();
        mapper.close();

        return id_cnt;
    }


    // 로그인
   public int Login(String id, String password)
    {
        SqlSession mapper = MySession.getSession();

        HashMap<String, String> hmap = new HashMap<>();

        hmap.put("id",id);
        hmap.put("password",password);

        int account = AccountDAO.getInstance().Login(mapper,hmap);

        mapper.close();

        return account;
    }

    public String nickname(String id, String password)
    {
        SqlSession mapper = MySession.getSession();

        HashMap<String, String> hmap = new HashMap<>();

        hmap.put("id",id);
        hmap.put("password",password);

        String nickname = AccountDAO.getInstance().nickanme(mapper,hmap);

        mapper.close();

        return nickname;
    }
}

