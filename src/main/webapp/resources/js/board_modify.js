$(function(){
   $("#checkAll").click(function() {
      if ($("#checkAll").prop("checked")) {
         $("input[type=checkbox]").prop("checked", true);
      } else {
         $("input[type=checkbox]").prop("checked", false);
      }
   })
   if($('#hidden').val()!=null){
      $('#image_title').css('opacity','1');
      $('#image_detail').css('opacity','1');
   }
   if($('#tag_name').val()!=null||$('#tag_name').val()!=""){
      $('#tag_name_ok').val("success");
   }
   var upload_title = $('#board_title')[0];
   upload_title.onchange = function(e) {
      e.preventDefault();
   
      var file_title = upload_title.files[0], reader_title = new FileReader();
      reader_title.onload = function(event) {
         var img_title = new Image();
         img_title.src = event.target.result;
         // note: no onload required since we've got the dataurl...I think! :)
         $('#image_title').css('opacity','1');
         $('#image_title').attr('src', event.target.result);
      };
      reader_title.readAsDataURL(file_title);
      
      $('#file_title').val("change");
   
      return false;
   };
   var upload_detail = $('#board_detail')[0];
   upload_detail.onchange = function(e) {
      e.preventDefault();
   
      var file_detail = upload_detail.files[0], reader_detail = new FileReader();
      reader_detail.onload = function(event) {
         var img_detail = new Image();
         img_detail.src = event.target.result;
         // note: no onload required since we've got the dataurl...I think! :)
         $('#image_detail').css('opacity','1');
         $('#image_detail').attr('src', event.target.result);
      };
      reader_detail.readAsDataURL(file_detail);
      
      $('#file_detail').val("change");
   
      return false;
   };
   
   $('#real_board_account').keyup(function(){
      var cnj_str = $('#real_board_account').val();
      var t_align = "right"; // 텍스트 필드 정렬
      var t_num = cnj_str.substring(0, 1); // 첫글자 확인 변수
      var num = /^[/,/,0,1,2,3,4,5,6,7,8,9,/]/; // 숫자와 , 만 가능
      var cnjValue = "";
      var cnjValue2 = "";

      /*if (!num.test(cnj_str)) {
         alert('숫자만 입력하십시오.nn특수문자와 한글/영문은 사용할수 없습니다.');
         $('#real_board_account').val("");
         $('#real_board_account').focus();
         return false;
      }*/

      if ((t_num < "0" || "9" < t_num)) {
         swal("숫자만 입력하십시오.");
         $('#real_board_account').val("");
         $('#real_board_account').focus();
         return false;
      }

      for (i = 0; i < cnj_str.length; i++) {
         if (cnj_str.charAt(cnj_str.length - i - 1) != ",") {
            cnjValue2 = cnj_str.charAt(cnj_str.length - i - 1)
                  + cnjValue2;
         }
      }

      for (i = 0; i < cnjValue2.length; i++) {

         if (i > 0 && (i % 3) == 0) {
            cnjValue = cnjValue2.charAt(cnjValue2.length - i - 1) + ","
                  + cnjValue;
         } else {
            cnjValue = cnjValue2.charAt(cnjValue2.length - i - 1)
                  + cnjValue;
         }
      }

      $('#real_board_account').val(cnjValue);
      $('#real_board_account').css('textAlign', 't_align');
      var split = $('#real_board_account').val().split(",");
      var sum = "";
      for(var i = 0 ; i < split.length ; i ++){
         sum +=split[i];
      }
      $('#board_account_split').val(sum);
      //alert($('#board_account_split').val());
   });
   $('#check_onclick').click(function() {
      if ($('#real_board_title').val() == "" || $('#real_board_category').val() == "" || $('#real_board_category').val() == "선택하세요" || $('#autocomplete').val() == "" 
         || $('#image_board_title').val() == "" || $('#image_board_detail').val() == "" || $('#real_board_movie_url').val() == ""
         || $('#real_board_content').val() == "" || $('#real_board_account').val() == "" || $('#nanumdatepicker').val() == ""
         || !$("input[type=checkbox]").is(":checked")){
         if ($('#real_board_title').val() == "") {
            swal("확인해주세요!","제목이 비어있습니다.")
            return false;
         } else if ($('#real_board_category').val() == "" || $('#real_board_category').val() == "선택하세요") {
            swal("확인해주세요!","카테고리가 비어있습니다.")
            return false;
         } else if ($('#autocomplete').val() == "") {
            swal("확인해주세요!","활동지역이 비어있습니다.")
            return false;
         } else if ($('#image_board_title').val() == "") {
            swal("확인해주세요!","대문사진이 비어있습니다.")
            return false;
         } else if ($('#image_board_detail').val() == "") {
            swal("확인해주세요!","상세사진이 비어있습니다.")
            return false;
         } else if ($('#real_board_movie_url').val() == "") {
            swal("확인해주세요!","동영상 경로가 비어있습니다.")
            return false;
         } else if ($('#real_board_content').val() == "") {
            swal("확인해주세요!","재능 설명이 비어있습니다.")
            return false;
         } else if ($('#real_board_account').val() == "") {
            swal("확인해주세요!","기본가격이 비어있습니다.")
            return false;
         } else if ($('#nanumdatepicker').val() == "") {
            swal("확인해주세요!","작업일이 비어있습니다.")
            return false;
         } else if (!$("input[type=checkbox]").is(":checked")) {
            swal("확인해주세요!","위 약관에 동의해야 합니다.")
            return false;
         }
      } else {
         $('#multiform').submit();
      }
   });
});