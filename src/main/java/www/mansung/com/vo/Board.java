package www.mansung.com.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Board extends Paging{
	int id;
	String title;
	String content;
	Date wdate;
	Date udate;
	int writer;
	int boardType;
	String writerName;
	int fileCnt;
	int pictureCnt;
	int viewCount;
	int replyCnt;
	String boardName;
	String language;
	String thumbnail;
}
