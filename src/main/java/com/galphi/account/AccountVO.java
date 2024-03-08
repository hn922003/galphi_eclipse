package com.galphi.account;

public class AccountVO
{
    // 필드 선언
    private String id;
    private String name;
    private String nickname;
    private String password;

    public AccountVO(){}

   // 생성자 선언
   public AccountVO(String id, String name, String nickname, String password)
   {
        super();
        this.id = id;
        this.name = name;
        this.nickname = nickname;
        this.password = password;
   }

    // getter & setter 선언

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;

    }


    // toString() 메소드 Override
    @Override
    public String toString() {
        return "accountVO{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", nickname='" + nickname + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
