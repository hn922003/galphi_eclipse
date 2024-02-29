function setting(idx, mode, score, memo) {
	let frm = document.commentForm // 댓글 폼을 저장한다.
//	수정 또는 삭제할 댓글 번호를 넣어준다. 댓글 입력 작업시는 0을 넣어준다.
	frm.idx.value = idx
//	commentOK.jsp에서 사용할 댓글 작업 모드를 넣어준다. 1 => 저장, 2 => 수정, 3 => 삭제
	frm.mode.value = mode
//	submit 버튼에 표시할 텍스트를 넣어준다.
	frm.score.value = score
//	수정 또는 삭제할 댓글 작성자 이름을 name 속성이 name인 텍스트 상자에 넣어준다.
	frm.name.value = nick	
	
//	frm.content.value = content.replace('<br/>', 'r\n')
	while(memo.indexOf('<br/>') != -1) {
		memo = memo.replace('<br/>', 'r\n')
	}
	frm.content.value = memo
}



