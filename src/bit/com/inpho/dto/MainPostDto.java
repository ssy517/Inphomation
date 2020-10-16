package bit.com.inpho.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.type.Alias;

public class MainPostDto implements Serializable{
	//post_seq,user_seq,user_nickname,post_like(count),post_bookmark(count),post_reply(count)
	private int postSeq;
	private int userSeq;
	private int postLike;
	private int postBookmark;
	private int postReply;
	private String userNickName;
	private String wdate;
	private String filePath;
	
	private List<String> hashtag;
	
	public MainPostDto() {}

	public int getPostSeq() {
		return postSeq;
	}
	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public void setPostSeq(int postSeq) {
		this.postSeq = postSeq;
	}

	public int getUserSeq() {
		return userSeq;
	}

	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}

	public int getPostLike() {
		return postLike;
	}

	public void setPostLike(int postLike) {
		this.postLike = postLike;
	}

	public int getPostBookmark() {
		return postBookmark;
	}

	public void setPostBookmark(int postBookmark) {
		this.postBookmark = postBookmark;
	}

	public int getPostReply() {
		return postReply;
	}

	public void setPostReply(int postReply) {
		this.postReply = postReply;
	}

	public String getUserNickName() {
		return userNickName;
	}

	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}

	public List<String> getHashtag() {
		return hashtag;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public void setHashtag(List<String> hashtag) {
		this.hashtag = hashtag;
	}

	@Override
	public String toString() {
		return "MainPostDto [postSeq=" + postSeq + ", userSeq=" + userSeq + ", postLike=" + postLike + ", postBookmark="
				+ postBookmark + ", postReply=" + postReply + ", userNickName=" + userNickName + ", wdate=" + wdate
				+ ", filePath=" + filePath + ", hashtag=" + hashtag + "]";
	}
	
}