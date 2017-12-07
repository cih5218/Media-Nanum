package com.nanum.persistance;

import java.sql.SQLException;
import java.util.List;

import com.nanum.domain.BoardNN;
import com.nanum.domain.Location;
import com.nanum.domain.MemberNN;

public interface ProfileDAO {
	// 상대 프로필 좋아요 수 가져오기
	public int getLike(int member_id) throws ClassNotFoundException, SQLException;

	// 상대 프로필 가져오기
	public List<BoardNN> getProfile(int member_id) throws ClassNotFoundException, SQLException;

	// 상대 프로필 정보 가져오기
	public MemberNN getProfileMember(int member_id) throws ClassNotFoundException, SQLException;

	// 프로필 가져오기
	public MemberNN select_membernn(int member_id) throws ClassNotFoundException, SQLException;

	// 프로필 위치정보 업데이트
	public int location_update(Location location) throws ClassNotFoundException, SQLException;

	// 프로필 정보 업데이트
	public int profile_update(MemberNN membernn) throws ClassNotFoundException, SQLException;

}
