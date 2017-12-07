<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin/admin.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script>
	$(function(){
		
  		$('.admin-panel').hide();
		$('.admin-container1').show();//첫번째 탭 보임
		$(".admin-report-btn").click(function(e) {
            //$(this).siblings('div').css('display','block');
        });
		$('.admin-header-nav>ul>li').on('click',function(){
			 index = $(this).index() + 1;
			 $('.admin-header-nav>ul>li').removeClass('active')
		     $('.admin-panel').hide();
		     $('.admin-container'+ index).fadeIn();
		     $(this).addClass('active');
   		});
	});
		
</script>
	<title>NANUM 관리자 페이지</title>
</head>
<body>
	<div class="admin-header">
		<div class="row margin-0-auto">
			<div class="admin-header-top">
				<div class="inline-block width-50">
					<div class="admin-logo">
						<a href="admin.nn"><h1>Administrator</h1></a>
					</div>
				</div>
				<div class="inline-blick width-50 float-right">
					<ul class="admin-headder-top-nav">
						<li><a href="index.nn">메인화면 이동</a></li>
						<li>
                        	<a href="security/logout">
                        		<span class="color-o">로그아웃</span>
                            </a>
                        </li>
					</ul>
				</div>
			</div>
			<div class="admin-header-nav">
				<ul>
					<li class="active">
						회원관리
						<!--<ul>
							<li><a href="#">회원관리</a></li>
							<li><a href="#">회원메일발송</a></li>
							<li><a href="#">접속자집계</a></li>
						</ul>-->
					</li>
					<li>
						게시판관리
						<!--<ul>
							<li><a href="#">게시판관리</a></li>
							<li><a href="#">게시판그룹관리</a></li>
							<li><a href="#">인기검색어관리</a></li>
							<li><a href="#">인기검색어순위</a></li>
							<li><a href="#">1:1문의</a></li>
							<li><a href="#">내용관리</a></li>
						</ul>-->
					</li>
                    <li>
						인기검색어
                    </li>
					<li>
						카테고리
						<!--<ul>
							<li><a href="#">기타</a></li>
							<li><a href="#">기타</a></li>
							<li><a href="#">기타</a></li>
						</ul>-->
					</li>
					<li>
						신고관리
						<!--<ul>
							<li><a href="#">문자보내기</a></li>
							<li><a href="#">전송내역</a></li>
						</ul>-->
					</li>
                    <li>
						SMS 관리
                    </li>
				</ul>
			</div>
		</div>
	</div>
    


	<div class="container-body">
		<div class="container admin-container">
        	
            <!-- 회원관리 -->
            <div class="admin-panel admin-container1">
                <div class="row margin-30">
                    <div class="admin-top">
                        <h2>회원관리</h2>
                        <div class="margin-15">
                            총 회원수 <b class="color-o">${fn:length(memberlist)}</b>&nbsp;명
                        </div>
                    </div>
                    <table  class="margin-20">
                        <tbody>
                            <tr>
                                <th>조회번호</th>
                                <th>회원번호</th>
                                <th>아이디</th>
                                <th>이름</th>
                                <th>나눔인증</th>
                                <th>권한</th>
                                <th>가입일</th>
                                <th>최종 접속일</th>
                            </tr>
                            <c:forEach items="${memberlist}" var="list" varStatus="i">
                            <tr>
                                <td>${i.count}</td>
                                <td>${list.member_id}</td>
                                <td>${list.member_email}</td>
                                <td>${list.member_name}</td>
                                <c:if test="${list.member_level >= 3}">
                                	<td>인증완료</td>
                                </c:if>
                                <c:if test="${list.member_level < 3}">
                                	<td>인증필요</td>
                                </c:if>
                                <td>
                                    <select>
                                    <c:choose>
                                    	<c:when test="${list.member_level == 0}">
	                                    	<option selected>대기회원</option>
	                                        <option>일반회원</option>
	                                        <option>재능대기</option>
	                                        <option>재능회원</option>
	                                        <option>블라인드</option>
                                    	</c:when>
                                    	<c:when test="${list.member_level == 1}">
	                                    	<option>대기회원</option>
	                                        <option selected>일반회원</option>
	                                        <option>재능대기</option>
	                                        <option>재능회원</option>
	                                        <option>블라인드</option>
                                    	</c:when>
                                    	<c:when test="${list.member_level == 2}">
	                                    	<option>대기회원</option>
	                                        <option>일반회원</option>
	                                        <option selected>재능대기</option>
	                                        <option>재능회원</option>
	                                        <option>블라인드</option>
                                    	</c:when>
                                    	<c:when test="${list.member_level == 3}">
	                                    	<option>대기회원</option>
	                                        <option>일반회원</option>
	                                        <option>재능대기</option>
	                                        <option selected>재능회원</option>
	                                        <option>블라인드</option>
                                    	</c:when>
                                    	<c:otherwise>
                                    		<option>대기회원</option>
	                                        <option>일반회원</option>
	                                        <option>재능대기</option>
	                                        <option>재능회원</option>
	                                        <option selected>블라인드</option>
                                    	</c:otherwise>
                                    </c:choose>
                                    </select>
                                </td>
                                <td>${list.member_signdate}</td>
                                <td>${list.member_lastdate}</td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- 회원관리 -->
            
            <!-- 게시글 관리 -->
            <div class="admin-panel admin-container2">
                <div class="row margin-30">
                    <div class="admin-top">
                        <h2>게시글관리</h2>
                        <div class="margin-15">
                            총 건수 <b class="color-o">${fn:length(boardlist)}</b>&nbsp;건
                        </div>
                    </div>
                    <table  class="margin-20">
                        <tbody>
                            <tr>
                                <th>조회번호</th>
                                <th>게시글번호</th>
                                <th style="max-width: 150px">제목</th>
                                <th>카테고리</th>
                                <th>금액</th>
                                <th>등록일</th>
                                <th>등록기간</th>
                                <th>조회수</th>
                                <th>권한</th>
                                <th>회원번호</th>
                                <th>글 상태</th>
                            </tr>
                            <fmt:formatDate value="${now}" pattern="yyyy/MM/dd" var="today"/>
                            <c:forEach items="${boardlist}" var="boardlist" varStatus="i">
                            <tr>
                                <td>${i.count}</td>
                                <td>${boardlist.board_no}</td>
                                <td style="max-width:150px; text-overflow: ellipsis; overflow:hidden; white-space: nowrap;">${boardlist.board_title}</td>
                                <td>${boardlist.board_category}</td>
                                <td>${boardlist.board_account}</td>
                                <td>${boardlist.board_date}</td>
                                <td>${boardlist.board_term}</td>
                                <td>${boardlist.board_hit}</td>
                                <td>
                                    <select>
                                    <c:if test="${boardlist.board_level == 1}">
                                    	<option selected>정상</option>
                                        <option>블라인드</option>
                                        <option>삭제대기</option>
                                    </c:if>
                                    <c:if test="${boardlist.board_level == 2}">
                                    	<option>정상</option>
                                        <option selected>블라인드</option>
                                        <option>삭제대기</option>
                                    </c:if>
                                    <c:if test="${boardlist.board_level == 3}">
                                    	<option>정상</option>
                                        <option>블라인드</option>
                                        <option selected>삭제대기</option>
                                    </c:if>
                                    </select>
                                </td>
                                <td>${boardlist.member_id}</td>
                                <c:choose>
                                <c:when test="${boardlist.board_term < today}">
                                	<td>마감</td>
                                </c:when>
                                <c:otherwise>
                                	<td>요청대기</td>
                                </c:otherwise>
                                </c:choose>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- 인기검색어관리 -->
            
            
            <!-- 인기태그검색 -->
            <div class="admin-panel admin-container3">
                <div class="row margin-30">
                    <div class="admin-top">
                        <h2>인기태그검색</h2>
                        <div class="margin-15">
                            총 건수 <b class="color-o">${fn:length(taglist)}</b>&nbsp;건
                        </div>
                    </div>
                    <table  class="margin-20">
                        <tbody>
                            <tr>
                                <th>조회번호</th>
                                <th>태그</th>
                                <th>조회수</th>
                            </tr>
                            <c:forEach items="${taglist}" var="taglist" varStatus="i">
                            <tr>
                                <td>${i.count}</td>
                                <td>${taglist.tag_name}</td>
                                <td>${taglist.tag_hits}</td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- 인기태그검색 -->
            
            <!-- 카테고리별 나눔 -->
            <div class="admin-panel admin-container4">
                <div class="row margin-30">
                    <div class="admin-top">
                        <h2>카테고리별 나눔</h2>
                        <div class="margin-15">
                            총 건수 <b class="color-o">${fn:length(boardlist)}</b>&nbsp;건
                        </div>
                    </div>
                    <table  class="margin-20">
                        <tbody>
                            <tr>
                                <th>조회번호</th>
                                <th>카테고리</th>
                                <th>오늘 나눔</th>
                                <th>전체 나눔</th>
                            </tr>
                            <c:forEach items="${categorylist}" var="categorylist" varStatus="i">
                             <tr>
                                <td>${i.count}</td>
                                <td>${categorylist.board_category}</td>
                                <td>${categorylist.category_count}</td>
                                <td>${categorylist.all_category}</td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- 인기검색어관리 -->
            
            <!-- 신고 관리 -->
            <div class="admin-panel admin-container5">
                <div class="row margin-30">
                    <div class="admin-top">
                        <h2>신고게시물 관리</h2>
                        <div class="margin-15">
                            총 신고수 <b class="color-o">${fn:length(reportlist)}</b>&nbsp;건
                        </div>
                        <table  class="margin-20">
                        <tbody>
                            <tr>
                                <th>조회번호</th>
                                <th>카테고리</th>
                                <th>신고자 번호</th>
                                <th>신고자 아이디</th>
                                <th>게시글번호</th>
                                <th>게시글제목</th>
                                <th>게시글권한</th>
                                <th>신고내용</th>
                                <th>신고날짜</th>
                            </tr>
                            <c:forEach items="${reportlist}" var="reportlist" varStatus="i">
                            <tr>
                                <td>${i.count}</td>
                                <td>${reportlist.report_category}</td>
                                <td>${reportlist.report_member_no}</td>
                                <td>${reportlist.member_email}</td>
                                <td>${reportlist.board_no}</td>
                                <td>${reportlist.board_title}</td>
                                <td>
                                    <select>
                                    <c:choose>
                                    	<c:when test="${reportlist.board_level == 1}">
	                                    	<option selected>정상</option>
	                                        <option>블라인드</option>
	                                        <option>삭제대기</option>
                                    	</c:when>
                                    	<c:when test="${reportlist.board_level == 2}">
	                                    	<option>정상</option>
	                                        <option selected>블라인드</option>
	                                        <option>삭제대기</option>
                                    	</c:when>
                                    	<c:otherwise>
                                    		<option>정상</option>
	                                        <option>블라인드</option>
	                                        <option selected>삭제대기</option>
                                    	</c:otherwise>
                                    </c:choose>
                                        
                                    </select>
                                </td>
                                <td class="position-relative">
                                    <span class="color-m admin-report-btn">상세보기</span>
                                    <!--내용 들어갈 자리-->
                                    <div class="admin-report-view color-o">${reportlist.report_content}</div>
                                    <!--내용 들어갈 자리-->
                                </td>
                                <td>${reportlist.report_date}</td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    </div>
                </div>
            </div>
            <!--  신고관리 -->
            
            <!-- sms 전송내역 -->
            <div class="admin-panel admin-container6">
                <div class="row margin-30">
                    <div class="admin-top">
                        <h2>SMS 전송내역</h2>
                        <div class="margin-15">
                            총 건수 <b class="color-o">${fn:length(smslistsend)}</b>&nbsp;건
                        </div>
                    </div>
                    <table  class="margin-20">
                        <tbody>
                            <tr>
                                <th>조회번호</th>
                                <th>판매자 아이디</th>
                                <th>구매자 아이디</th>
                                <th>글 번호</th>
                                <th>날짜</th>
                            </tr>
                            <c:forEach items="${smslistsend}" var="smslistsend" varStatus="i">
                            <tr>
                                <td>${i.count}</td>
                                <td>${smslistreceive[i.index].receive_id}</td>
                                <td>${smslistsend.send_id}</td>
                                <td>${smslistsend.board_no}</td>
                                <td>${smslistsend.sms_date}</td>
                            </tr>
                            </c:forEach>
                             <!-- <tr>
                                <td>2</td>
                                <td>jinwosin</td>
                                <td>ohyes5654</td>
                                <td>25</td>
                                <td>2016/06/25</td>
                            </tr> -->
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- sms 전송내역 -->
            
            
		</div>
	</div>
</body>
</html>