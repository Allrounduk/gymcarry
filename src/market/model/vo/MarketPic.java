package market.model.vo;

import java.sql.Timestamp;

public class MarketPic {
	
	private String fileName;
	private int marketNo;
	private long fileSize;
	private String fileUser;
	private Timestamp uploadTime;
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getMarketNo() {
		return marketNo;
	}
	public void setMarketNo(int marketNo) {
		this.marketNo = marketNo;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public String getFileUser() {
		return fileUser;
	}
	public void setFileUser(String fileUser) {
		this.fileUser = fileUser;
	}
	public Timestamp getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(Timestamp uploadTime) {
		this.uploadTime = uploadTime;
	}
	@Override
	public String toString() {
		return "MarketPic [fileName=" + fileName + ", marketNo=" + marketNo + ", fileSize=" + fileSize + ", fileUser="
				+ fileUser + ", uploadTime=" + uploadTime + "]";
	}
	
	
}
