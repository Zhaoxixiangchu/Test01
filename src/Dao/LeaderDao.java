package Dao;

import domain.Approval;
import domain.Leader;
import domain.Worker;

import java.util.List;

public interface LeaderDao {
    public boolean FindPWD(String id,String name,String IDNUM,String pwd);
    public boolean Login(String username,String id,String password);
    public List<Leader> LeaderInfo(String user_id);
    public Leader EditLeader(Leader leader);
    public List<Approval> ApprovalInfo();
    public List<Approval> ApprovalCounts(int page,int limit);
    public List<Worker> WorkerInfo();
    public List<Worker> WorkerCounts(int page,int limit);
    public boolean Save(String id,String status);
    public boolean SaveInfo(String id,String dept,String position,String address);
    public boolean DelInfo(String id);



}
