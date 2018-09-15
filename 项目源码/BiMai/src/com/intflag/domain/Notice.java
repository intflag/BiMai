package com.intflag.domain;

import java.io.Serializable;
import java.util.Date;

import com.intflag.utils.LocalDateUtils;
/**
 * 公告实体类
 * @author LGX
 *
 */
public class Notice implements Serializable {
	private static final long serialVersionUID = 1L;
	/*
	 * `nid` int(11) NOT NULL AUTO_INCREMENT,
  `ntitle` varchar(526) DEFAULT NULL,
  `ndesc` varchar(1024) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `ndate` datetime DEFAULT NULL,
	 */
	private Integer nid;
	private String ntitle;
	private String ndesc;
	private Date ndate;
	private Admin admin;
	
	private String localDate;
	
	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getNid() {
		return nid;
	}
	public void setNid(Integer nid) {
		this.nid = nid;
	}
	public String getNdesc() {
		return ndesc;
	}
	public void setNdesc(String ndesc) {
		this.ndesc = ndesc;
	}
	public Date getNdate() {
		return ndate;
	}
	public void setNdate(Date ndate) {
		this.ndate = ndate;
	}
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	@Override
	public String toString() {
		return "Notice [nid=" + nid + ", ndesc=" + ndesc + ", ndate=" + ndate
				+ ", admin=" + admin + "]";
	}
	public String getLocalDate() {
		return LocalDateUtils.getSimpleLocalDate(this.ndate);
	}
	public void setLocalDate(String localDate) {
		this.localDate = localDate;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	
}
