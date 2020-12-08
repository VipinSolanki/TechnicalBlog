package com.entities;

import java.sql.Timestamp;

public class Post 
{
    private int pid;
    private String pTitle;
    private String pContent;
    private String pCode;
    private String pPic;
    private Timestamp pDate;
    private int catId;
    private int Id;

    public Post() 
    {
		super();
		// TODO Auto-generated constructor stub
	}

	public Post(int pid, String pTitle, String pContent, String pCode, String pPic, Timestamp pDate, int catId,int Id) {
		super();
		this.pid = pid;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pPic = pPic;
		this.pDate = pDate;
		this.catId = catId;
		this.Id=Id;
	}

	public Post(String pTitle, String pContent, String pCode, String pPic, Timestamp pDate, int catId,int Id) {
		super();
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pPic = pPic;
		this.pDate = pDate;
		this.catId = catId;
		this.Id=Id;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getpTtitle() {
		return pTitle;
	}

	public void setpTtitle(String pTtitle) {
		this.pTitle = pTtitle;
	}

	public String getpContent() {
		return pContent;
	}

	public void setpContent(String pContent) {
		this.pContent = pContent;
	}

	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	public String getpPic() {
		return pPic;
	}

	public void setpPic(String pPic) {
		this.pPic = pPic;
	}

	public Timestamp getpDate() {
		return pDate;
	}

	public void setpDate(Timestamp pDate) {
		this.pDate = pDate;
	}

	public int getCatId() {
		return catId;
	}

	public void setCatId(int catId) {
		this.catId = catId;
	}

	public int getId() {
		return Id;
	}

	public void setUserId(int Id) {
		this.Id = Id;
	}    
}
