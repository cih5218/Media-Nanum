package com.nanum.domain;

import java.util.Comparator;

public class MiniComparator implements Comparator<BoardNN> {
	

	@Override
	public int compare(BoardNN first, BoardNN second) {
		double firstValue = first.getDistance();
		double seconeValue = second.getDistance();

		if(firstValue > seconeValue){
			return 1;
		}else if(firstValue < seconeValue){
			return -1;
		}else{
			return 0;
		}		
	}

}
