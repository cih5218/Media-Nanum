package com.nanum.service;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.nanum.domain.BoardNN;
import com.nanum.domain.CheckBoard;
import com.nanum.domain.CheckRe;
import com.nanum.domain.Checked;
import com.nanum.domain.Location;
import com.nanum.domain.Member;
import com.nanum.domain.MemberNN;
import com.nanum.domain.MiniComparator;
import com.nanum.domain.Nanum_Connect_List;
import com.nanum.domain.SMS;
import com.nanum.domain.Tag;
import com.nanum.persistance.BoardDAO;
import com.nanum.persistance.MemberDAO;
import com.nanum.persistance.ProfileDAO;

@Service
public class BoardService {
	
	@Autowired
	private SqlSession sqlsession;
	
	//등록 게시글 작성
	public void board_writeOk(HttpServletRequest request, BoardNN boardnn, Location location, Tag tag, String wk, String tag_name_ok, List<String> filenames) throws ClassNotFoundException, SQLException, IOException{
		MemberDAO memberDao = sqlsession.getMapper(MemberDAO.class);
		BoardDAO boardDao = sqlsession.getMapper(BoardDAO.class);
		memberDao.insert_location(location); // 위치 정보 입력
		UserDetails userinfo = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal(); // 로그인한
		System.out.println("userinfo:"+userinfo.getUsername());
		int num1 = wk.indexOf(","); // 위도 경도 나누기
		int num2 = wk.length(); // 위도 경도 나누기
		location.setLocation_wedo(Double.parseDouble(wk.substring(1, num1))); // 위도 경도 매핑
		location.setLocation_kyoungdo(Double.parseDouble(wk.substring(num1 + 2, num2 - 1))); // 위도 경도 매핑
		boardnn.setLocation_no(memberDao.select_location_no()); // 위치 정보 번호 매핑
		boardnn.setMember_id(memberDao.select_member_no(userinfo.getUsername())); // 회원 번호 매핑
		boardnn.setBoard_image_title(filenames.get(0)); // 등록 게시글 입력
		boardnn.setBoard_image_detail(filenames.get(1));
		System.out.println("tag:"+tag.getTag_name());
		
		memberDao.board_write(boardnn);
		if (tag_name_ok.equals("success")) {
			int count = 0;
			String[] str = tag.getTag_name().split("#");
			List<Tag> list = boardDao.tag_select_list();
			for (int i = 1; i < str.length; i++) {
				for (int j = 0; j < list.size(); j++) {
					if (list.get(j).getTag_name().equals(str[i])) {
//						System.out.println("str:"+str[i]);
						count++;
					}
				}
				if (count == 0) {
					boardDao.tag_insert(str[i]);
				}
				count = 0;
				boardDao.taginfo_insert(str[i]);
			}
		}
	}
	
	// 등록 게시글 상세보기
	public HashMap<String, Object> board_detail(BoardNN boardnn, String board_no, HttpSession session) throws ClassNotFoundException, SQLException{
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		MemberDAO memberDao = sqlsession.getMapper(MemberDAO.class);
		ProfileDAO profileDAO = sqlsession.getMapper(ProfileDAO.class);
		BoardDAO boardDao = sqlsession.getMapper(BoardDAO.class);
		UserDetails userinfo = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal(); // 로그인한
		int board_number = Integer.parseInt(board_no);
		SimpleDateFormat formatter = new SimpleDateFormat ( "yyyyMMdd", Locale.KOREA );
		Date currentTime = new Date ( );
		int today = Integer.parseInt(formatter.format ( currentTime ));
		int termday = Integer.parseInt(boardnn.getBoard_term().substring(0, 10).replace("-", ""));
		boardnn.setBoard_term(String.valueOf(today-termday));
		String str = "false";
		if(memberDao.board_member_select(board_number).equals(userinfo.getUsername())){str = "sussece";}
		Member member = (Member)session.getAttribute("Member");
		List<CheckRe> checkrelist = boardDao.checkre_list(Integer.parseInt(board_no));
		if(boardnn.getMember_id()!=memberDao.select_member_no(userinfo.getUsername())){
			boardDao.update_board_hit(boardnn);
		}
		String category = boardnn.getBoard_category();
		List<BoardNN> connectboardlist = boardDao.connect_board_list(category);
		List<MemberNN> connectboardmember = boardDao.connect_board_Member(category);
		hashmap.put("checkrelist", checkrelist);
		hashmap.put("str", str);
		hashmap.put("result", boardDao.board_check_eva(Integer.parseInt(board_no), member.getMember_id()));
		hashmap.put("taginfo", boardDao.board_taginfo_list(board_number));
		hashmap.put("user_email", memberDao.board_member_select(board_number)); // 글쓴이의 이메일
		hashmap.put("list", memberDao.checkboard_list(board_number)); // 댓글 리스트
		hashmap.put("userid", userinfo.getUsername()); // 현재 로그인한 사람의 이메일
		hashmap.put("boardnn", boardnn); // 등록 게시글 내용
		hashmap.put("membernn", profileDAO.select_membernn(boardnn.getMember_id())); // 글쓴이의 프로필
		hashmap.put("member", memberDao.select_member(boardnn.getMember_id())); // 글쓴이의 정보
		hashmap.put("count", memberDao.count_boardnn(boardnn.getMember_id())); // 글쓴이의 작업수
		hashmap.put("location", memberDao.select_location(boardnn.getLocation_no()));
		hashmap.put("writernn", profileDAO.select_membernn(memberDao.select_member_no(userinfo.getUsername())));
		hashmap.put("mylocation", session.getAttribute("Location"));
		hashmap.put("connectboardlist",connectboardlist); //비슷한 게시글 가져오기
		hashmap.put("connectboardmember",connectboardmember); //비슷한 게시글 회원 정보 가져오기
		return hashmap;
	}
	
	// 등록 게시글 상세 댓글
	public HashMap<String, Object> check_board(String check_score, String check_content, String board_no, CheckBoard checkboard, Checked check) throws ClassNotFoundException, SQLException{
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		MemberDAO memberDao = sqlsession.getMapper(MemberDAO.class);
		ProfileDAO profileDAO = sqlsession.getMapper(ProfileDAO.class);
		// 로그인한 회원 정보 가져오기
		UserDetails userinfo = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		check.setMember_id(memberDao.select_member_no(userinfo.getUsername()));
		check.setChecked_score(Integer.parseInt(check_score));
		check.setCheck_content(check_content);
		memberDao.check_insert(check);
		checkboard.setCheck_no(memberDao.check_no_select());
		checkboard.setBoard_no(Integer.parseInt(board_no));
		memberDao.check_board_insert(checkboard);
		MemberNN receiver_member = profileDAO.select_membernn(memberDao.select_member_no(memberDao.board_member_select(Integer.parseInt(board_no))));
		String check_date = memberDao.check_board_date(checkboard);
		MemberNN sender_member = profileDAO.select_membernn(memberDao.select_member_no(userinfo.getUsername()));
		hashmap.put("sender_member", sender_member);
		hashmap.put("receiver_member", receiver_member);
		hashmap.put("check_date", check_date);
		hashmap.put("userid", userinfo.getUsername());
		hashmap.put("check", check);
		return hashmap;
		
	}
	
	// 등록 게시글 수정하기
	public HashMap<String, Object> board_modify(String board_no) throws NumberFormatException, ClassNotFoundException, SQLException{
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		MemberDAO memberDao = sqlsession.getMapper(MemberDAO.class);
		BoardDAO boardDAO = sqlsession.getMapper(BoardDAO.class);
		BoardNN boardnn = boardDAO.board_detail(Integer.parseInt(board_no));
		String date = boardnn.getBoard_term().substring(0, 10).replace("-", "");
		boardnn.setBoard_term(date);
		hashmap.put("taginfo", sqlsession.getMapper(BoardDAO.class).board_taginfo_list(Integer.parseInt(board_no)));
		hashmap.put("boardnn", boardnn);
		hashmap.put("location", memberDao.select_location(boardnn.getLocation_no()));
		return hashmap;
	}
	
	// 등록 게시글 수정완료
	public void board_modifyOk(HttpServletRequest request, BoardNN boardnn, Location location, Tag tag, String board_no,
			String wk, String title, String detail, String file_title, String file_detail, String tag_name_ok, List<String> filenames) throws NumberFormatException, ClassNotFoundException, SQLException{
		BoardDAO boardDao = sqlsession.getMapper(BoardDAO.class);
		boardDao.taginfo_delete(Integer.parseInt(board_no));
		if (file_title.equals("change") && file_detail.equals("change")) {
			boardnn.setBoard_image_title(filenames.get(0));
			boardnn.setBoard_image_detail(filenames.get(1));
		} else if (file_title.equals("change") && !file_detail.equals("change")) {
			boardnn.setBoard_image_title(filenames.get(0));
			boardnn.setBoard_image_detail(detail);
		} else if (!file_title.equals("change") && file_detail.equals("change")) {
			boardnn.setBoard_image_title(title);
			boardnn.setBoard_image_detail(filenames.get(1));
		} else if (!file_title.equals("change") && !file_detail.equals("change")) {
			boardnn.setBoard_image_title(title);
			boardnn.setBoard_image_detail(detail);
		}
		boardnn.setBoard_no(Integer.parseInt(board_no));
		int num1 = wk.indexOf(","); // 위도 경도 나누기
		int num2 = wk.length(); // 위도 경도 나누기
		MemberDAO memberDao = sqlsession.getMapper(MemberDAO.class);
		ProfileDAO profileDAO = sqlsession.getMapper(ProfileDAO.class);
		location.setLocation_wedo(Double.parseDouble(wk.substring(1, num1))); // 위도 경도 매핑
		location.setLocation_kyoungdo(Double.parseDouble(wk.substring(num1 + 2, num2 - 1))); // 위도 경도 매핑
		profileDAO.location_update(location); // 위치 정보 업데이트
		memberDao.boardnn_update(boardnn); // 등록 게시글 입력
		if (tag_name_ok.equals("success")) {
			int count = 0;
			String[] str = tag.getTag_name().split("#");
			List<Tag> list = boardDao.tag_select_list();
			for (int i = 1; i < str.length; i++) {
				for (int j = 0; j < list.size(); j++) {
					if (list.get(j).getTag_name().equals(str[i])) {
						count++;
					}
				}
				if (count == 0) {
					boardDao.tag_insert(str[i]);
				}
				count = 0;
				boardDao.taginfo_insert(str[i]);
			}
		}
	}
	
	// 평가 글 댓글 입력
	public HashMap<String, Object> checkre_insert(HttpServletRequest request, CheckRe checkre) throws ClassNotFoundException, SQLException{
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		checkre.setCheck_no(Integer.parseInt(request.getParameter("check_id")));
		checkre.setCheckre_content(request.getParameter("checkre_content"));
		UserDetails userinfo = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		checkre.setMember_id(sqlsession.getMapper(MemberDAO.class).select_member_no(userinfo.getUsername()));
		BoardDAO boardDao = sqlsession.getMapper(BoardDAO.class);
		int result = boardDao.checkre_insert(checkre);
		hashmap.put("result",result);
		hashmap.put("checkre_content", checkre.getCheckre_content());
		return hashmap;
	}
	
	//보드 리스트
	public HashMap<String, Object> board_list(String title,String search, HttpServletRequest request,String pg,String category,String cityName,String gooName,String latitude, String longitude, String loc) throws ClassNotFoundException, SQLException{
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		MemberDAO memberDao = sqlsession.getMapper(MemberDAO.class);
		BoardDAO boardDao = sqlsession.getMapper(BoardDAO.class);
		List tag = memberDao.getTag();
		hashmap.put("tag", tag);
		
		int page = 1;
		String strpg = pg;
		if (strpg != null) {
			page = Integer.parseInt(strpg);
		}
		String categoryall = category;
		if (categoryall == null) {
			categoryall = "all";
		}
		int rowSize = 20;
		int start = (page * rowSize) - (rowSize - 1);
		int end = page * rowSize;
		
		if ((search == null || search == "") && (cityName == null || cityName=="")) { //일반 리스트 보여주기
			System.out.println("일반 리스트");
			int total = memberDao.getBoardCount(title);

			hashmap=pageCount(hashmap, total, rowSize, page);
			
			HashMap map = new HashMap();
			map.put("title", title);
			map.put("categoryall", categoryall);
			if(loc != null){				
				map.put("start", 1);
				map.put("end", total);
				List<BoardNN> totallist = memberDao.pageBoardList(map);
				distancePaging(hashmap, totallist, latitude, longitude, total, page, start);
			}else{
				map.put("start", start);
				map.put("end", end);
				System.out.println(title);
				List<BoardNN> list = memberDao.pageBoardList(map);
				System.out.println(list.size());
				Distanceinsert(list, latitude, longitude);			
				hashmap.put("list", list);
			}		
			hashmap.put("categoryall", categoryall);
			
		}else if((cityName != null && cityName !="")){ //지역 검색 리스트 보여주기
	         System.out.println("지역 리스트");
	         request.setAttribute("cityName", cityName);
	         System.out.println(gooName);
	         HashMap map = new HashMap();
	         map.put("cityName", cityName);
	         map.put("title", title);
	         map.put("gooName", gooName);
	         request.setAttribute("gooName", gooName);
	         
	         int total = boardDao.getAreaSearchCount(map);
	         hashmap=pageCount(hashmap, total, rowSize, page);
	         
	         map.put("categoryall", categoryall);
	         
	         if(loc != null){				
					map.put("start", 1);
					map.put("end", total);
					List<BoardNN> totallist = boardDao.getAreaSearchList(map);
					distancePaging(hashmap, totallist, latitude, longitude, total, page, start);
			}else{
					map.put("start", start);
					map.put("end", end);
					List<BoardNN> list = boardDao.getAreaSearchList(map);
					System.out.println(list.size());
					Distanceinsert(list, latitude, longitude);				
					hashmap.put("list", list);
				}
	         hashmap.put("categoryall", categoryall);
	         
		}else { //검색 결과 리스트 보여주기
			System.out.println("검색 리스트");
			request.setAttribute("search", search);
			HashMap map = new HashMap();
			map.put("search", search);
			int total = memberDao.getSearchResultCount(map);
			hashmap=pageCount(hashmap, total, rowSize, page);
			map.put("search", search);
			map.put("categoryall", categoryall);			
			if(loc != null){				
				map.put("start", 1);
				map.put("end", total);
				List<BoardNN> totallist = memberDao.SearchpageBoardList(map);
				distancePaging(hashmap, totallist, latitude, longitude, total, page, start);
			}else{
				map.put("start", start);
				map.put("end", end);
				List<BoardNN> list = memberDao.SearchpageBoardList(map);			
				Distanceinsert(list, latitude, longitude);				
				hashmap.put("list", list);
			}
			hashmap.put("categoryall", categoryall);
		}
		return hashmap;
	}
	
	public List<BoardNN> Distanceinsert(List<BoardNN> list,String latitude, String longitude) throws ClassNotFoundException, SQLException{
		MemberDAO memberDao = sqlsession.getMapper(MemberDAO.class);
		for(BoardNN boardnn : list){					
			Location location=memberDao.select_location(boardnn.getLocation_no());					
			double lat = 0;
			double lon = 0;
			if(latitude==null || latitude==""){
				lat = location.getLocation_wedo();
				lon = location.getLocation_kyoungdo();
			}else{
				lat = Double.parseDouble(latitude);
				lon = Double.parseDouble(longitude);
			}
			double dis=calDistance(location.getLocation_wedo(),location.getLocation_kyoungdo(),lat,lon);					
			boardnn.setDistance(dis);					
		}
		return list;
	}
	

	public HashMap<String, Object> distancePaging(HashMap<String, Object> hashmap,List<BoardNN> totallist,String latitude, String longitude,int total, int page, int start) throws ClassNotFoundException, SQLException{
		List<BoardNN> list = new ArrayList<BoardNN>();
		Distanceinsert(totallist, latitude, longitude);					
		MiniComparator comp = new MiniComparator();
		Collections.sort(totallist, comp);
		int max = 0;
		if((page*20) < total){;
			max=20;
		}else{
			max=total%20+start-1;
		}
		for(int i = start-1 ; i < max ; i++){
			list.add(totallist.get(i));
		}
		hashmap.put("list", list);
		hashmap.put("loc", "ture");
		return hashmap;
	}
	
	
	public HashMap<String, Object> pageCount(HashMap<String, Object> hashmap, int total, int rowSize, int page){
		 int allPage = (int) Math.ceil(total / (double) rowSize); // 페이지수
         // int totalPage = total/rowSize + (total%rowSize==0?0:1);

         int block = 4; // 한페이지에 보여줄 범위 << [1] [2] [3] [4] [5] [6] [7] [8]
                     // [9]
                     // [10] >>
         int fromPage = ((page - 1) / block * block) + 1; // 보여줄 페이지의 시작
         // ((1-1)/10*10)
         int toPage = ((page - 1) / block * block) + block; // 보여줄 페이지의 끝
         if (toPage > allPage) { // 예) 20>17
            toPage = allPage;
         }
         hashmap.put("pg", page);
         hashmap.put("allPage", allPage);
		 hashmap.put("block", block);
		 hashmap.put("fromPage", fromPage);
		 hashmap.put("toPage", toPage);
		
		return hashmap;
	}
	
	
	public double calDistance(double lat1, double lon1, double lat2, double lon2) {

		double theta, dist;
		theta = lon1 - lon2;
		dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2))
				+ Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
		dist = Math.acos(dist);
		dist = rad2deg(dist);

		dist = dist * 60 * 1.1515;
		dist = dist * 1.609344; // 단위 mile 에서 km 변환.
		// dist = dist * 1000.0; // 단위 km 에서 m 로 변환
		dist = Math.round(dist * 10d) / 10d;
		return dist;
	}

	// 주어진 도(degree) 값을 라디언으로 변환
	private double deg2rad(double deg) {
		return (double) (deg * Math.PI / (double) 180d);
	}

	// 주어진 라디언(radian) 값을 도(degree) 값으로 변환
	private double rad2deg(double rad) {
		return (double) (rad * (double) 180d / Math.PI);
	}
	
	
	////보드 나눔 리스트
	public void board_nanum_list(List<SMS> sms_sell, List<SMS> sms_buy) throws ClassNotFoundException, SQLException{

		System.out.println("board_nanum_list service");
		
		BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class); // sql문 설정
		
		List<Nanum_Connect_List> sell_result = new ArrayList<Nanum_Connect_List>();
		List<Nanum_Connect_List> buy_result = new ArrayList<Nanum_Connect_List>();

		System.out.println(sms_sell.size());

		if (sms_sell.size() != 0) {
			for (SMS list : sms_sell) {
				Nanum_Connect_List result = boarddao.nanum_list_sell(list.getSend_id(), list.getBoard_no(), 1);
				// System.out.println(result.toString());
				if (sell_result != null) {
					sell_result.add(result);
				}
			}

		}
		if (sms_buy.size() != 0) {
			for (SMS list : sms_buy) {
				Nanum_Connect_List result = boarddao.nanum_list_buy(list.getSend_id(), list.getBoard_no(), 1);
				if (result != null) {
					buy_result.add(result);
				}
			}
		}

	}
	
		
}
