package com.pwx.video_sharing.file.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

import com.pwx.video_sharing.user.entity.Cms_Roles;
/**
 * 
 * <文件实体类>
 * 
 * @version 
 * <pre>
 * Author	Version		Date		Changes
 * pengweixiong 	1.0  		2015年6月4日 	Created
 *
 * </pre>
 * @since 1.
 */
@Entity
@Table(name="file")
public class File {
	@Id
    @Column(length = 32)
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    private String id;
	
	//用户ID
    @Column(name="userId")
    private String userId;
    
    //文件名
    @Column(name="fileName")
    private String fileName;

    //文件的链接
    @Column(name="fileUrl")
    private String fileUrl;
    
    //文件类型
    @Column(name="fileType")
    private String fileType;
    
    //文件描述
    @Column(name="fileDescript")
    private String fileDescript;
    
    //文件大小
    @Column(name="fileSize")
    private String fileSize;
    
    //文件状态   0:文件正在审核  1:文件已被分享	2:文件被打回
    @Column(name="fileState")
    private String fileState;
    
    //分享状态	是否分享		0：分享	 	1：不分享
    @Column(name="shareState")
    private String shareState;
    
    //观看次数
    @Column(name="watchCount")
    private String watchCount;
   
    //下载次数
    @Column(name="downLoadCount")
    private String downLoadCount;
    
    //视频帧缩略图的URL
    @Transient
    private String vframeUrl;
    
    //创建时间
    @Column(name="createDate")
    private String createDate;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileUrl() {
		return fileUrl;
	}

	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public String getFileDescript() {
		return fileDescript;
	}

	public void setFileDescript(String fileDescript) {
		this.fileDescript = fileDescript;
	}

	public String getFileSize() {
		return fileSize;
	}

	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}

	public String getFileState() {
		return fileState;
	}

	public void setFileState(String fileState) {
		this.fileState = fileState;
	}

	public String getShareState() {
		return shareState;
	}

	public void setShareState(String shareState) {
		this.shareState = shareState;
	}

	public String getWatchCount() {
		return watchCount;
	}

	public void setWatchCount(String watchCount) {
		this.watchCount = watchCount;
	}

	public String getDownLoadCount() {
		return downLoadCount;
	}

	public void setDownLoadCount(String downLoadCount) {
		this.downLoadCount = downLoadCount;
	}

	public String getVframeUrl() {
		return vframeUrl;
	}

	public void setVframeUrl(String vframeUrl) {
		this.vframeUrl = vframeUrl;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	@Override
	public String toString() {
		return "File [id=" + id + ", userId=" + userId + ", fileName="
				+ fileName + ", fileUrl=" + fileUrl + ", fileType=" + fileType
				+ ", fileDescript=" + fileDescript + ", fileSize=" + fileSize
				+ ", fileState=" + fileState + ", shareState=" + shareState
				+ ", watchCount=" + watchCount + ", downLoadCount="
				+ downLoadCount + ", vframeUrl=" + vframeUrl + ", createDate="
				+ createDate + "]";
	}

	public File() {
		super();
	}
    
    
	
	
}
