package com.shuangyulin.service;

import java.util.ArrayList;
import javax.annotation.Resource; 
import org.springframework.stereotype.Service;
import com.shuangyulin.po.PostInfo;
import com.shuangyulin.po.UserInfo;
import com.shuangyulin.po.Reply;

import com.shuangyulin.mapper.ReplyMapper;
@Service
public class ReplyService {

	@Resource ReplyMapper replyMapper;
    /*每页显示记录数目*/
    private int rows = 10;;
    public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}

    /*保存查询后总的页数*/
    private int totalPage;
    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
    public int getTotalPage() {
        return totalPage;
    }

    /*保存查询到的总记录数*/
    private int recordNumber;
    public void setRecordNumber(int recordNumber) {
        this.recordNumber = recordNumber;
    }
    public int getRecordNumber() {
        return recordNumber;
    }

    /*添加回复记录*/
    public void addReply(Reply reply) throws Exception {
    	replyMapper.addReply(reply);
    }

    /*按照查询条件分页查询回复记录*/
    public ArrayList<Reply> queryReply(UserInfo userObj,String replyTime,PostInfo postInfoObj,int currentPage) throws Exception { 
     	String where = "where 1=1";
    	if(null != userObj &&  userObj.getUser_name() != null  && !userObj.getUser_name().equals(""))  where += " and t_reply.userObj='" + userObj.getUser_name() + "'";
    	if(!replyTime.equals("")) where = where + " and t_reply.replyTime like '%" + replyTime + "%'";
    	if(null != postInfoObj && postInfoObj.getPostInfoId()!= null && postInfoObj.getPostInfoId()!= 0)  where += " and t_reply.postInfoObj=" + postInfoObj.getPostInfoId();
    	int startIndex = (currentPage-1) * this.rows;
    	return replyMapper.queryReply(where, startIndex, this.rows);
    }

    /*按照查询条件查询所有记录*/
    public ArrayList<Reply> queryReply(UserInfo userObj,String replyTime,PostInfo postInfoObj) throws Exception  { 
     	String where = "where 1=1";
    	if(null != userObj &&  userObj.getUser_name() != null && !userObj.getUser_name().equals(""))  where += " and t_reply.userObj='" + userObj.getUser_name() + "'";
    	if(!replyTime.equals("")) where = where + " and t_reply.replyTime like '%" + replyTime + "%'";
    	if(null != postInfoObj && postInfoObj.getPostInfoId()!= null && postInfoObj.getPostInfoId()!= 0)  where += " and t_reply.postInfoObj=" + postInfoObj.getPostInfoId();
    	return replyMapper.queryReplyList(where);
    }

    /*查询所有回复记录*/
    public ArrayList<Reply> queryAllReply()  throws Exception {
        return replyMapper.queryReplyList("where 1=1");
    }

    /*当前查询条件下计算总的页数和记录数*/
    public void queryTotalPageAndRecordNumber(UserInfo userObj,String replyTime,PostInfo postInfoObj) throws Exception {
     	String where = "where 1=1";
    	if(null != userObj &&  userObj.getUser_name() != null && !userObj.getUser_name().equals(""))  where += " and t_reply.userObj='" + userObj.getUser_name() + "'";
    	if(!replyTime.equals("")) where = where + " and t_reply.replyTime like '%" + replyTime + "%'";
    	if(null != postInfoObj && postInfoObj.getPostInfoId()!= null && postInfoObj.getPostInfoId()!= 0)  where += " and t_reply.postInfoObj=" + postInfoObj.getPostInfoId();
        recordNumber = replyMapper.queryReplyCount(where);
        int mod = recordNumber % this.rows;
        totalPage = recordNumber / this.rows;
        if(mod != 0) totalPage++;
    }

    /*根据主键获取回复记录*/
    public Reply getReply(int replyId) throws Exception  {
        Reply reply = replyMapper.getReply(replyId);
        return reply;
    }

    /*更新回复记录*/
    public void updateReply(Reply reply) throws Exception {
        replyMapper.updateReply(reply);
    }

    /*删除一条回复记录*/
    public void deleteReply (int replyId) throws Exception {
        replyMapper.deleteReply(replyId);
    }

    /*删除多条回复信息*/
    public int deleteReplys (String replyIds) throws Exception {
    	String _replyIds[] = replyIds.split(",");
    	for(String _replyId: _replyIds) {
    		replyMapper.deleteReply(Integer.parseInt(_replyId));
    	}
    	return _replyIds.length;
    }
}
