package Dao;

import domain.Approval;
import domain.Worker;

import java.util.List;

public interface WorkerDao {
    /**用户登录*/
    public boolean Login(String username,String id,String password);

    /**用户注册*/
    public boolean Regist(String Name,String sex,String Age,String Id,String Email,String Phone,String IDNUM,String Pwd,String Position,String dept,String address);

    /**找回密码*/
    public boolean FindPWD(String id,String name,String IDNUM,String pwd);

    /**信息查询*/
    public List<Worker> WorkerInfo(String user_id);

    /**信息修改*/
    public Worker EditWorker(Worker worker);

    /**审批信息查阅
     * @return*/
    public List<Approval> ApprovalInfo(String user_id);

    /**分页*/
     public List<Approval> ApprovalCounts(String user_id,int page,int limit);

    /**新建审批*/
    public boolean InsertApproval(String worker_id,String worker_approval,String worker_name,String worker_dept,String worker_address,String worker_reason,String worker_date);
}
