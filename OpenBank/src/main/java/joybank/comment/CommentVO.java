package joybank.comment;

public class CommentVO {

	private int repCd;
	private int post_cd;
    private String u_id;
    private String repContent;
    

	public int getRepCd() {
		return repCd;
	}


	public void setRepCd(int repCd) {
		this.repCd = repCd;
	}
	
	
	public int getPost_cd() {
		return post_cd;
	}


	public void setPost_cd(int post_cd) {
		this.post_cd = post_cd;
	}


	public String getU_id() {
		return u_id;
	}


	public void setU_id(String u_id) {
		this.u_id = u_id;
	}


	public String getRepContent() {
		return repContent;
	}


	public void setRepContent(String repContent) {
		this.repContent = repContent;
	}


	@Override
	public String toString() {
		return "CommentVO [repCd=" + repCd + ", post_cd=" + post_cd + ", u_id=" + u_id + ", repContent=" + repContent
				+ "]";
	}


}
