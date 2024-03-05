function passwordCheck(obj)
{
    let id = obj.id.value
    let name = obj.name.value
    let nickname = obj.nickname.value
    let password = obj.password.value
    let repassword = obj.repassword.value


    // 누락된 정보가 있는지 확인하는 조건문
    if ((id === '') || (name === '') || (nickname === '') || (password === '') || (repassword === ''))
    {
        alert("누락된 정보가 있습니다.")
        return false
    }

    // 비밀번호와 다시 입력한 비밀번호가 같은지 여부 확인
    if(password.trim() !== repassword.trim())
    {
        alert("비밀번호가 일치하지 않습니다.")
        obj.password.value = ''
        obj.repassword.value = ''
        obj.password.focus()
        return false
    }
    return true
}

//
function pwCheck()
{
    let password = document.getElementsByName('password')[0]
    let repassword = document.getElementsByName('repassword')[0]

    if (password.value !== repassword.value)
    {
        document.getElementById('checkMsg').innerHTML =
            '<span style="color: red">비밀번호가 일치하지 않습니다.'
    }
    else
    {
        document.getElementById('checkMsg').innerHTML = ''
    }
}


function nickCheck()
{
    let nickname = document.getElementsByName('nickname')[0].value

    console.log(nick_cnt)
}