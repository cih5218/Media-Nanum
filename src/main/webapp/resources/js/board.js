// JavaScript Document

//달력
$( document ).ready(function() {

	    $( "#nanumdatepicker" ).datepicker({
	        showButtonPanel: true, 
	        currentText: '오늘', 
	        closeText: '닫기', 
	        dateFormat: "yymmdd",
	        changeMonth: true, 
	        changeYear: true,
	        nextText: 'next',
	        prevText: 'prev', 
	       	minDate: 0
	  });

      // form 전에 null check
	  $("#btn").click(function(){
	 
	    var result = txtFieldCheck() == true ? true : false;
	   
	    console.log(result);
	    
	    if(result==false){
	    	
	    	swal('게시글이 등록되었습니다');
	    	$("#btn").submit();
	    //	var url = "input_requestBoard.nn";    
	    //	$(location).attr('href',url)
	    }else{
	    	return false;
	    }
	 
	  });

});

	function txtFieldCheck(){
	// form안의 모든 text type 조회
	
		// console.log($(txtEle[i]).val());
		
		if("" == $('#title').val() || null == $('#title').val()){
			
			alert("제목을 입력해 주세요!" );
			return true;
			
		}
		if("" == $('#account').val() || null == $('#account').val()){
			
			alert("금액을 입력해 주세요!");
			return true;
		
		}
		if($('#category').val() == "선택하세요"){
			alert("카테고리를 선택해주세요!");
			$("#category").focus();
			return true;
		}
		if(""==$('#content').val()|| null==$('#content').val()){
			alert("내용을 입력해주세요!")
			$("#content").focus();
			return true;
		}
	
}