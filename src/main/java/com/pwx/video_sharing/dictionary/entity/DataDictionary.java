package com.pwx.video_sharing.dictionary.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

/**
 * 
 * <描述这个类>
 * 
 * @version 
 * <pre>
 * Author	Version		Date		Changes
 * tanchao 	1.0  		2015年6月12日 	Created
 *
 * </pre>
 * @since 1.
 */

@Entity
@Table(name = "systemDataDictionary")
public class DataDictionary implements Comparable<DataDictionary>, Cloneable
{
	// Fields
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	//主键    数据字典表ID	
	@Column(name = "ID", nullable = false)
	private java.lang.Integer id;

	// 字典名称	
	@Column(name = "TEXT", nullable = true)
	private java.lang.String text;

	//真实值	
	@Column(name = "REALVALUE", nullable = true)
	private java.lang.String realvalue;

	//字段名称	
	@Column(name = "FILEDNAME", nullable = true)
	private java.lang.String filedname;

	//备注	
	@Column(name = "REMARK", nullable = true)
	private java.lang.String remark;

	//父ID	
	@Column(name = "PID", nullable = true)
	private java.lang.Integer pid;

	//父级名称	
	@Column(name = "PNAME", nullable = true)
	private java.lang.String pname;

	@Column(name = "SORTNO", nullable = true)
	private java.lang.Integer sortno;

	// Constructors

	/** default constructor */
	public DataDictionary()
	{
	}

	/** full constructor */
	public DataDictionary(Integer id, String text, String realvalue, String filedname, String remark, Integer pid, String pname, Integer sortno)
	{
		this.id = id;
		this.text = text;
		this.realvalue = realvalue;
		this.filedname = filedname;
		this.remark = remark;
		this.pid = pid;
		this.pname = pname;
		this.sortno = sortno;
	}

	public java.lang.Integer getId()
	{
		return this.id;
	}

	public void setId(java.lang.Integer id)
	{
		this.id = id;
	}

	public java.lang.String getText()
	{
		return this.text;
	}

	public void setText(java.lang.String text)
	{
		this.text = text;
	}

	public java.lang.String getRealvalue()
	{
		return this.realvalue;
	}

	public void setRealvalue(java.lang.String realvalue)
	{
		this.realvalue = realvalue;
	}

	public java.lang.String getFiledname()
	{
		return this.filedname;
	}

	public void setFiledname(java.lang.String filedname)
	{
		this.filedname = filedname;
	}

	public java.lang.String getRemark()
	{
		return this.remark;
	}

	public void setRemark(java.lang.String remark)
	{
		this.remark = remark;
	}

	public java.lang.Integer getPid()
	{
		return this.pid;
	}

	public void setPid(java.lang.Integer pid)
	{
		this.pid = pid;
	}

	public java.lang.String getPname()
	{
		return this.pname;
	}

	public void setPname(java.lang.String pname)
	{
		this.pname = pname;
	}

	public java.lang.Integer getSortno()
	{
		return this.sortno;
	}

	public void setSortno(java.lang.Integer sortno)
	{
		this.sortno = sortno;
	}

	public boolean equals(Object obj)
	{
		if (obj == null)
		{
			return false;
		}
		if (obj.getClass() != getClass())
		{
			return false;
		}
		if (obj == this)
		{
			return true;
		}
		return EqualsBuilder.reflectionEquals(this, obj);
	}

	public int hashCode()
	{
		return HashCodeBuilder.reflectionHashCode(this);
	}

	public String toString()
	{
		return new StringBuilder(120).append("DataDictionary [").append("id=").append(id).append(",").append("text=").append(text).append(",").append("realvalue=").append(realvalue).append(",").append("filedname=").append(filedname).append(",").append("remark=").append(remark).append(",").append("pid=").append(pid).append(",").append("pname=").append(pname).append(",").append("sortno=").append(sortno).append("]").toString();
	}

	public DataDictionary clone()
	{
		DataDictionary o = null;
		try
		{
			o = (DataDictionary) super.clone();
		} catch (CloneNotSupportedException e)
		{
		}
		return o;
	}

	@Override
	public int compareTo(DataDictionary o)
	{
		int flag = this.getSortno().compareTo(o.getSortno());
		if (flag == 0)
		{
			flag = this.getId().compareTo(o.getId());
		}
		return flag;
	}

}