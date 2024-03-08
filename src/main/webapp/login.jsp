<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인</title>

    <style type="text/css">
        table
        {
            margin-left: auto;
            margin-right: auto;
            margin-top: 200px;
        }
    </style>

    <script type="text/javascript" src="./js/Account.js" defer></script>
</head>
<body>
<form action="loginOk.jsp" method="post" onsubmit="return true">
    <table width="300" border="1" cellpadding="5" cellspacing="0" align="center">
        <tr>
            <th colspan="2">로그인</th>
        </tr>

        <tr>
            <th width="150">아이디</th>
            <td width="250">
                <input class="input" type="text" name="id" placeholder="아이디를 입력해주세요"/>
            </td>
        </tr>

        <tr>
            <th>비밀번호</th>
            <td>
                <input class="input" type="password" name="password" placeholder="비밀번호를 입력하세요"/>
            </td>
        </tr>

        <tr>
            <td colspan="2" align="center">
                <input type="button" value="로그인" onclick="login(form)"/>
                <input type="button" value="취소" onclick="location.href='index.jsp'"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
