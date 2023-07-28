package service;

import lombok.Data;

@Data
public class Paging {
	private int currentPage; //현재 위치한 페이지의 번호
	private int pageSize = 8; //한 페이지당 나타낼 요소의 수
	private int startRow; //해당 페이지의 시작 요소 번호
	private int totalRow; //데이터베이스의 전체 요소 개수
	private int totalPage; //전체 페이지 수
	
	private int currentBlock; //현재 페이지가 위치한 블럭
	private int blockSize = 5; //한 블럭에 속한 페이지 수
	private int startPage; //블럭의 시작 페이지 번호
	private int endPage; //블럭의 마지막 페이지 번호
	
	public Paging(int currentPage, int totalRow){
		this.totalRow = totalRow;
		if (totalRow == 0) { //데이터가 없을 경우 페이지 수 1
			this.totalPage = 1;
		}else {
			this.totalPage = totalRow/pageSize;
			if (totalRow % pageSize != 0) {
				totalPage += 1;
			}
		}
		
		if (currentPage < 1 || currentPage > totalPage) { //페이지 범위 외 값 입력 시 1로 초기화
			this.currentPage = 1;
		} else {
			this.currentPage = currentPage;
		}
		
		this.startRow = (this.currentPage-1) * pageSize;
		
		this.currentBlock = this.currentPage / blockSize;
		if (this.currentPage % blockSize != 0) {
			currentBlock += 1;
		}
		this.startPage = (currentBlock-1) * blockSize + 1;
		this.endPage = currentBlock * blockSize;
		if (endPage > totalPage) {
			endPage = totalPage;
		}
	}
}
