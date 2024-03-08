<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>

    <style type="text/css">
        .input
        {
            width: 70%;
            padding: 5px;
            background-color: skyblue;
        }

        table
        {
            margin-left: auto;
            margin-right: auto;
            margin-top: 200px;
        }

    </style>

    <script type="text/javascript" src="js/Account.js" defer></script>

</head>
<body>
<form action="account_insert.jsp" method="post" onsubmit="return account(this)">
    <table width="500" border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th colspan="2">회원가입</th>
        </tr>

        <tr>
            <th width="150">아이디</th>
            <td width="350">
                <input class="input" type="text" name="id" placeholder="아이디를 입력해주세요"/>
                <input class="Id_Check" type="button" name="Id_Check" value="중복확인" onclick="IdCheck(form)">
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
                <input class="nick_Check" type="button" name="nick_Check" value="중복확인" onclick="nickCheck(form)">
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
                <input type="button" value="가입" onclick="CreateAcc(form)"/>
                <input type="button" value="취소" onclick="location.href='main_page.jsp'"/>
            </td>
        </tr>
    </table>
</form>

</body>
</html>
