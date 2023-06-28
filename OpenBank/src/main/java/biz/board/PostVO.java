package biz.board;

import java.util.Date;

public class PostVO {

	private int postCd;
	private int uCd;
	private String postTitle;
	private String postContent;
	private Date postDate;
	private int postStat;
	private String repCd;
	
	
	public PostVO() {
		super();
		this.postCd = postCd;
		this.uCd = uCd;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.postDate = postDate;
		this.postStat = postStat;
		this.repCd = repCd;
	}


	public int getPostCd() {
		return postCd;
	}


	public void setPostCd(int postCd) {
		this.postCd = postCd;
	}


	public int getuCd() {
		return uCd;
	}


	public void setuCd(int uCd) {
		this.uCd = uCd;
	}


	public String getPostTitle() {
		return postTitle;
	}


	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}


	public String getPostContent() {
		return postContent;
	}


	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}


	public Date getPostDate() {
		return postDate;
	}


	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}


	public int getPostStat() {
		return postStat;
	}


	public void setPostStat(int postStat) {
		this.postStat = postStat;
	}


	public String getRepCd() {
		return repCd;
	}


	public void setRepCd(String repCd) {
		this.repCd = repCd;
	}


	@Override
	public String toString() {
		return "PostVO [postCd=" + postCd + ", uCd=" + uCd + ", postTitle=" + postTitle + ", postContent=" + postContent
				+ ", postDate=" + postDate + ", postStat=" + postStat + ", repCd=" + repCd + "]";
	}


	
}
