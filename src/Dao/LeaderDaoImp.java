package Dao;

import Dutil.Dbean;
import domain.Approval;
import domain.Leader;
import domain.Worker;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class LeaderDaoImp implements LeaderDao{
    @Override
    public boolean FindPWD(String id, String name, String IDNUM, String pwd) {
        boolean flag = false;
        Dbean.databean();
        String sql ="update leader set leader_pwd='"+pwd+"' where leader_id='"+id+"' and leader_name='"+name+"' and leader_IDNUM='"+IDNUM+"' ";
        int i = Dbean.executeUpdate(sql);
        try{
            if(i>0){
                flag = true;
            }else {
                flag = false;
            }
        }catch (Exception e){
            System.out.println("FINDPWD EXCEPTION");
        }
        return flag;
    }


    @Override
    public boolean Login(String username, String id, String password) {
        boolean flag = false;
        Dbean.databean();
        String sql = "select * from leader where leader_name='"+username+"' and leader_id='"+id+"' and leader_pwd='"+password+"'";
        ResultSet rs = Dbean.executeQuery(sql);
        try{
            if (rs.next()){
                flag = true;
            }else {
                flag = false;
            }
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("LEADERDAOIMP");
        }
        return flag;
    }

    @Override
    public List<Leader> LeaderInfo(String user_id) {
        List<Leader> list = new ArrayList<Leader>();
        Dbean.databean();
        String sql = "select * from leader where leader_id='"+user_id+"'";
        ResultSet rs = Dbean.executeQuery(sql);
        try{
            if(rs.next()){
                Leader worker = new Leader();
                worker.setLeader_id(rs.getString("leader_id"));
                worker.setLeader_name(rs.getString("leader_name"));
                worker.setLeader_pwd(rs.getString("leader_pwd"));
                worker.setLeader_phone(rs.getString("leader_phone"));
                worker.setLeader_email(rs.getString("leader_email"));
                worker.setLeader_position(rs.getString("leader_position"));
                worker.setLeader_gen(rs.getString("leader_gen"));
                worker.setLeader_age(rs.getLong("leader_age"));
                worker.setLeader_IDNUM(rs.getString("leader_IDNUM"));
                list.add(worker);
            }else {
                list = null;
            }
            Dbean.close();
        }catch (Exception e){
            System.out.println("LEADERINFO");
        }
        return list;
    }

    @Override
    public Leader EditLeader(Leader leader) {
        Dbean.databean();
        String sql = "update leader set leader_pwd='"+leader.getLeader_pwd()+"',leader_phone='"+leader.getLeader_phone()+"',leader_email='"+leader.getLeader_email()+"',leader_age='"+leader.getLeader_age()+"',leader_position='"+leader.getLeader_position()+"',leader_IDNUM='"+leader.getLeader_IDNUM()+"' where leader_id='"+leader.getLeader_id()+"'";
        String exq = "select * from leader where leader_id='"+leader.getLeader_id()+"'";
        try{
            int i = Dbean.executeUpdate(sql);
            if(i>0){
                ResultSet rs = Dbean.executeQuery(exq);
                if(rs.next()){
                    return leader;
                }else {
                    return null;
                }
            }
        }catch (Exception e){
            System.out.println("EDITLEADER");
        }
        return leader;
    }

    public List<Approval> ApprovalInfo() {
        Dbean.databean();
        List<Approval> list = new ArrayList<Approval>();
        String sql = "select  worker_id,worker_approval_id,worker_approval,worker_reason,worker_date,worker_status,worker_name ,worker_dept,worker_address from approval";
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

    @Override
    public List<Approval> ApprovalCounts(int page, int limit) {
        Dbean.databean();
        List<Approval> list = new ArrayList<Approval>();
        int start = (page-1)*limit;
        String sql = "select * from approval  limit "+start+","+limit+" ";
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

    @Override
    public List<Worker> WorkerInfo() {
        Dbean.databean();
        List<Worker> list = new ArrayList<Worker>();
        String sql = "select  worker_id,worker_name,worker_gen,worker_age,worker_dept,worker_position ,worker_address,worker_phone,worker_email from worker";
        ResultSet rs = Dbean.executeQuery(sql);
        try{
            while(rs.next()){
                Worker worker = new Worker();
                worker.setWorker_id(rs.getString("worker_id"));
                worker.setWorker_name(rs.getString("worker_name"));
                worker.setWorker_gen(rs.getString("worker_gen"));
                worker.setWorker_age(rs.getLong("worker_age"));
                worker.setWorker_dept(rs.getString("worker_dept"));
                worker.setWorker_position(rs.getString("worker_position"));
                worker.setWorker_address(rs.getString("worker_address"));
                worker.setWorker_phone(rs.getString("worker_phone"));
                worker.setWorker_email(rs.getString("worker_email"));
                list.add(worker);
            }
            Dbean.close();
            return list;
        }catch (Exception e){
            System.out.println("WORKERINFO");
        }
        return list;
    }

    @Override
    public List<Worker> WorkerCounts(int page, int limit) {
        Dbean.databean();
        List<Worker> list = new ArrayList<Worker>();
        int start = (page-1)*limit;
        String sql = "select * from worker  limit "+start+","+limit+" ";
        ResultSet rs = Dbean.executeQuery(sql);
        try{
            while(rs.next()){
                Worker worker = new Worker();
                worker.setWorker_id(rs.getString("worker_id"));
                worker.setWorker_name(rs.getString("worker_name"));
                worker.setWorker_gen(rs.getString("worker_gen"));
                worker.setWorker_age(rs.getLong("worker_age"));
                worker.setWorker_dept(rs.getString("worker_dept"));
                worker.setWorker_position(rs.getString("worker_position"));
                worker.setWorker_address(rs.getString("worker_address"));
                worker.setWorker_phone(rs.getString("worker_phone"));
                worker.setWorker_email(rs.getString("worker_email"));
                list.add(worker);
            }
            Dbean.close();
            return list;
        }catch (Exception e){
            System.out.println("APPROVALINFO");
        }

        return list;
    }

    @Override
    public boolean Save(String id,String status) {
        boolean flag = false;
        Dbean.databean();
        String sql ="update approval set worker_status='"+status+"' where worker_approval_id='"+id+"'";
        try{
            int i = Dbean.executeUpdate(sql);
            if(i>0){
                flag = true;
            }
        }catch (Exception e){
            System.out.println("SAVE");
        }
        return flag;
    }

    @Override
    public boolean SaveInfo(String id, String dept,String position,String address) {
        boolean flag = false;
        Dbean.databean();
        String sql ="update worker set worker_dept='"+dept+"',worker_position='"+position+"',worker_address='"+address+"' where worker_id='"+id+"'";
        try{
            int i = Dbean.executeUpdate(sql);
            if(i>0){
                flag = true;
            }
        }catch (Exception e){
            System.out.println("SAVEINFO");
        }
        return flag;
    }

    @Override
    public boolean DelInfo(String id) {
        boolean flag = false;
        Dbean.databean();
        String sql ="delete from worker where worker_id='"+id+"'";
        String query = "select * from approval where worker_id='"+id+"'";
        String sql1 = "delete  from approval where worker_id='"+id+"'";
        try{
            int i = Dbean.executeUpdate(sql);
            ResultSet rs = Dbean.executeQuery(query);
            if(i>0){
                if(rs.next()){
                   int n = Dbean.executeUpdate(sql1);
                   if(n>0){
                       flag = true;
                   }
                }else{
                    flag = true;
                }
            }

        }catch (Exception e){
            System.out.println("DELINFO");
        }
        return flag;
    }
}
