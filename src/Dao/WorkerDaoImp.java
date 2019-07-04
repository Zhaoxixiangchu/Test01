package Dao;

import Dutil.Dbean;
import domain.Approval;
import domain.Worker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.List;

public class WorkerDaoImp implements WorkerDao {



    @Autowired
    JdbcTemplate jdbcTemplate;

    /**
     * 用户登录
     * @param username
     * @param id
     * @param password
     * @return
     */
    public boolean Login(String username, String id, String password){
        boolean flag = false;
        Dbean.databean();
        String sql = "select * from worker where worker_name='"+username+"' and worker_id='"+id+"' and worker_pwd='"+password+"'";
        ResultSet rs = Dbean.executeQuery(sql);
        try{
            if (rs.next()){
                flag = true;
            }else {
                flag = false;
            }
            Dbean.close();
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("WORKERDAOIMP");
        }
        return flag;
    }

    /**
     * 用户注册
     * @param Name
     * @param sex
     * @param Age
     * @param Id
     * @param Email
     * @param Phone
     * @param IDNUM
     * @param Pwd
     * @param Position
     * @return
     */

    public boolean Regist(String Name, String sex, String Age, String Id, String Email, String Phone, String IDNUM, String Pwd,String Position,String dept,String address) {
        boolean flag = false;
        Dbean.databean();
        String sql = "select * from worker where worker_id='"+Id+"'";
        ResultSet rs = Dbean.executeQuery(sql);
        try{
            if(rs.next()){
                flag = false;
            }else {
                String ins = "insert into worker (worker_id,worker_name,worker_pwd,worker_phone,worker_email,worker_position,worker_gen,worker_age,worker_IDNUM,worker_dept,worker_address) values('"+Id+"','"+Name+"','"+Pwd+"','"+Phone+"','"+Email+"','"+Position+"','"+sex+"','"+Age+"','"+IDNUM+"','"+dept+"','"+address+"')";
                int i = Dbean.executeUpdate(ins);
                if(i>0){
                    flag = true;
                }else {
                    flag = false;
                }
            }
            Dbean.close();
        }catch (SQLIntegrityConstraintViolationException e ){

            System.out.println("REGISTER");
        }catch (Exception exception){

        }
        return flag;
    }


    /**
     * 找回密码
     * @param id
     * @param name
     * @param IDNUM
     * @return
     */
    public boolean FindPWD(String id,String name,String IDNUM,String pwd) {
        boolean flag = false;
        Dbean.databean();
        String sql ="update worker set worker_pwd='"+pwd+"' where worker_id='"+id+"' and worker_name='"+name+"' and worker_IDNUM='"+IDNUM+"' ";
        int i = Dbean.executeUpdate(sql);
        try{
            if(i>0){
                flag = true;
            }else {
                flag = false;
            }
            Dbean.close();
        }catch (Exception e){
            System.out.println("FINDPWD EXCEPTION");
        }
        return flag;
    }

    /**
     * 员工信息查看
     * @param user_id
     * @return
     */
    public List<Worker> WorkerInfo(String user_id) {
        List<Worker> list = new ArrayList<Worker>();
        Dbean.databean();
        String sql = "select * from worker where worker_id='"+user_id+"'";
        ResultSet rs = Dbean.executeQuery(sql);
        try{
            if(rs.next()){
                Worker worker = new Worker();
                worker.setWorker_id(rs.getString("worker_id"));
                worker.setWorker_name(rs.getString("worker_name"));
                worker.setWorker_pwd(rs.getString("worker_pwd"));
                worker.setWorker_phone(rs.getString("worker_phone"));
                worker.setWorker_email(rs.getString("worker_email"));
                worker.setWorker_position(rs.getString("worker_position"));
                worker.setWorker_dept(rs.getString("worker_dept"));
                worker.setWorker_address(rs.getString("worker_address"));
                worker.setWorker_gen(rs.getString("worker_gen"));
                worker.setWorker_age(rs.getLong("worker_age"));
                worker.setWorker_IDNUM(rs.getString("worker_IDNUM"));
                list.add(worker);
            }else {
                list = null;
            }
            Dbean.close();
        }catch (Exception e){
            System.out.println("WORKINFO");
        }
        return list;
    }

    /**
     * 员工信息修改
     * @param worker
     * @return
     */
    public Worker EditWorker(Worker worker) {
        Dbean.databean();
        String sql = "update worker set worker_pwd='"+worker.getWorker_pwd()+"',worker_phone='"+worker.getWorker_phone()+"',worker_email='"+worker.getWorker_email()+"',worker_age='"+worker.getWorker_age()+"',worker_position='"+worker.getWorker_position()+"',worker_IDNUM='"+worker.getWorker_IDNUM()+"',worker_dept='"+worker.getWorker_dept()+"',worker_address='"+worker.getWorker_address()+"' where worker_id='"+worker.getWorker_id()+"'";
        System.out.println(sql);
        String exq = "select * from worker where worker_id='"+worker.getWorker_id()+"'";
        try{
            int i = Dbean.executeUpdate(sql);
            if(i>0){
                ResultSet rs = Dbean.executeQuery(exq);
                if(rs.next()){
                    return worker;
                }else {
                    return null;
                }
            }
        }catch (Exception e){
            System.out.println("EDITWORKER");
        }
        return worker;
    }

    /**
     * 员工审批查看
     * @param user_id
     * @return
     */
    public List<Approval> ApprovalInfo(String user_id) {
        Dbean.databean();
        List<Approval> list = new ArrayList<Approval>();
        String sql = "select  worker_id,worker_approval_id,worker_approval,worker_reason,worker_date,worker_status,worker_name,worker_dept,worker_address from approval where worker_id = '"+user_id+"'";
        System.out.println(sql);
        ResultSet rs = Dbean.executeQuery(sql);
        try{
            while(rs.next()){
                Approval approval = new Approval();
                approval.setWorker_approval_id(rs.getInt("worker_approval_id"));
                approval.setWorker_id(rs.getString("worker_id"));
                approval.setWorker_name(rs.getString("worker_name"));
                approval.setWorker_approval(rs.getString("worker_approval"));
                approval.setWorker_reason(rs.getString("worker_reason"));
                approval.setWorker_date(rs.getString("worker_date"));
                approval.setWorker_dept(rs.getString("worker_dept"));
                approval.setWorker_address(rs.getString("worker_address"));
                approval.setWorker_status(rs.getString("worker_status"));
                list.add(approval);
            }
            Dbean.close();
            return list;
        }catch (Exception e){
            System.out.println("APPROVALINFO");
        }
        return list;
    }

    /**
     * 分页
     * @param user_id
     * @param page
     * @param limit
     * @return
     */
    public List<Approval> ApprovalCounts(String user_id, int page, int limit) {
        Dbean.databean();
        List<Approval> list = new ArrayList<Approval>();
        int start = (page-1)*limit;
        String sql = "select * from approval where worker_id='"+user_id+"' limit "+start+","+limit+" ";
        System.out.println(sql);
        ResultSet rs = Dbean.executeQuery(sql);
        try{
            while(rs.next()){
                Approval approval = new Approval();
                approval.setWorker_approval_id(rs.getInt("worker_approval_id"));
                approval.setWorker_id(rs.getString("worker_id"));
                approval.setWorker_name(rs.getString("worker_name"));
                approval.setWorker_approval(rs.getString("worker_approval"));
                approval.setWorker_reason(rs.getString("worker_reason"));
                approval.setWorker_date(rs.getString("worker_date"));
                approval.setWorker_dept(rs.getString("worker_dept"));
                approval.setWorker_address(rs.getString("worker_address"));
                approval.setWorker_status(rs.getString("worker_status"));
                list.add(approval);
            }
            Dbean.close();
            return list;
        }catch (Exception e){
            System.out.println("APPROVALINFO");
        }

        return list;
    }

    /**
     * 新建审批
     * @param worker_id
     * @param worker_approval
     * @param worker_name
     * @param worker_reason
     * @param worker_date
     * @return
     */
    public boolean InsertApproval(String worker_id, String worker_approval, String worker_name,String worker_dept,String worker_address, String worker_reason, String worker_date) {
        boolean flag = false;
        Dbean.databean();
        String sql = "insert into approval (worker_id,worker_name,worker_dept,worker_address,worker_approval,worker_reason,worker_date) values ('"+worker_id+"','"+worker_name+"','"+worker_dept+"','"+worker_address+"','"+worker_approval+"','"+worker_reason+"','"+worker_date+"')";
        try{
            int i = Dbean.executeUpdate(sql);
            if(i>0){
                flag = true;
            }
        }catch (Exception e){
            flag = false;
            System.out.println("INSERTAPPROVAL");
        }
        return flag;
    }


}
