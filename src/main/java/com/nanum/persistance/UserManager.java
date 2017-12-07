package com.nanum.persistance;

import com.nanum.domain.Location;
import com.nanum.domain.Member;
import com.nanum.domain.MemberNN;


public interface UserManager {

	
	//
	public Member getUser(String member_email);
	
	//
	public MemberNN getMemberNN(int member_id);
	
	//
	public Location getLocation(int location_no);

}
