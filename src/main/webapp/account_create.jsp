<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>

    <style type="text/css">

        .mail
        {
            width: 30%;
            padding: 5px;
            background-color: skyblue;
        }

        .mail_list
        {
            width: 30%;
            padding: 5px;
        }

        .input
        {
            width: 70%;
            padding: 5px;
            background-color: skyblue;
        }
    </style>

    <script type="text/javascript" src="./js/passwordCheck.js" defer></script>

</head>
<body>
<form action="account_insert.jsp" method="post" onsubmit="return passwordCheck(this)">
    <table width="500" border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th colspan="2">회원가입</th>
        </tr>

        <tr>
            <th width="150">이메일</th>
            <td width="350">
                <input class="mail" type="text" name="id"/>
                <select class="mail_list" name="usermail" id="usermail">
                    <option>naver.com</option>
                    <option>gmail.com</option>
                    <option>daum.com</option>
                </select>
<%--
                <input type="button" name="cert_send" value="인증번호 전송">
--%>
            </td>
        </tr>

        <tr>
            <th>이름</th>
            <td>
                <input class="input" type="text" name="name" placeholder="이름을 입력하세요"/>
            </td>
        </tr>

        <tr>
            <th>닉네임</th>
            <td>
                <input class="input" type="text" name="nickname" placeholder="닉네임을 입력하세요"/>
                <input class="nickname_chk" type="button" name="nickname_chk" value="중복확인" onclick="nickCheck(form)">
                <div id="CheckMessage"></div>
            </td>
        </tr>

        <tr>
            <th>비밀번호</th>
            <td>
                <input class="input" type="password" name="password" placeholder="비밀번호를 입력하세요"/>
            </td>
        </tr>

        <tr>
            <th>비밀번호 확인</th>
            <td>
                <input class="input" type="password" name="repassword" placeholder="비밀번호를 한번 더 입력하세요" onkeyup="pwCheck()"/>
                <div id="checkMsg"></div>
            </td>
        </tr>

        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="가입"/>
                <input type="button" value="취소" onclick="location.href='main_page.jsp'"/>
            </td>
        </tr>
    </table>
</form>

</body>
</html>
