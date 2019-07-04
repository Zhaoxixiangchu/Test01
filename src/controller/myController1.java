package controller;

import Dao.LeaderDao;
import Dao.LeaderDaoImp;

import domain.Approval;
import domain.Leader;
import domain.Worker;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
public class myController1 {
    @ResponseBody
    @RequestMapping("EditLeader")
    public Map<String,String> EditWorker(Leader leader, HttpSession session, HttpServletRequest request, HttpServletResponse response){
        LeaderDao ld = new LeaderDaoImp();
        Leader leader1 = ld.EditLeader(leader);
        Map<String,String> data = new HashMap<String,String>();
        if(leader1!=null){
            session.setAttribute("list",leader1);
            data.put("msg","1");
        }else {
            data.put("msg","0");
        }
        return data;
    }



    @RequestMapping("LeaderInfo")
    public ModelAndView LeaderInfo(String user_id, Model model){
        LeaderDao ld = new LeaderDaoImp();
        List<Leader> list = ld.LeaderInfo(user_id);
        ModelAndView modelAndView = new ModelAndView();
        model.addAttribute("list",list);
        modelAndView.setViewName("LeaderInfo.jsp");
        return modelAndView;
    }

    @RequestMapping("LeaderApproval")
    public ModelAndView Approval(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("FindApproval.jsp");
        return modelAndView;
    }


    @RequestMapping("FindApproval")
    @ResponseBody
    public Map<String,Object> ShowApproval(int page,int limit){
        LeaderDao ld = new LeaderDaoImp();
        List<Approval> list = ld.ApprovalInfo();
        List<Approval> list1 = ld.ApprovalCounts(page,limit);
        System.out.println(list);
        Map<String,Object> tableData = new LinkedHashMap<String, Object>();
        tableData.put("code",0);
        tableData.put("msg","");
        tableData.put("count",list.size());
        tableData.put("data",list1);
        return tableData;
    }

    @ResponseBody
    @RequestMapping("Save")
    public Map<String,String> Save(String worker_approval_id,String worker_status, HttpSession session, HttpServletRequest request, HttpServletResponse response){
        LeaderDao ld = new LeaderDaoImp();
        Map<String,String> data = new HashMap<String,String>();
        if(ld.Save(worker_approval_id,worker_status)){
                data.put("msg","1");
            }else {
                data.put("msg","0");
            }
        return data;
    }


    @RequestMapping("PersonnelMatters")
    public ModelAndView PersonnelMatters(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("PersonnelMatters.jsp");
        return modelAndView;
    }


    @RequestMapping("FindAllInfo")
    @ResponseBody
    public Map<String,Object> FindAllInfo(int page,int limit){
        LeaderDao ld = new LeaderDaoImp();
        List<Worker> list = ld.WorkerInfo();
        List<Worker> list1 = ld.WorkerCounts(page,limit);
        Map<String,Object> tableData = new LinkedHashMap<String, Object>();
        tableData.put("code",0);
        tableData.put("msg","");
        tableData.put("count",list.size());
        tableData.put("data",list1);
        return tableData;
    }

    @RequestMapping("SaveInfo")
    @ResponseBody
    public Map<String,String> SaveInfo(String worker_id,String worker_dept,String worker_position,String worker_address ){
        LeaderDao ld = new LeaderDaoImp();
        Map<String,String> data = new HashMap<String,String>();
        if(ld.SaveInfo(worker_id,worker_dept,worker_position,worker_address)){
            data.put("msg","1");
        }else {
            data.put("msg","0");
        }
        return data;
    }

    @RequestMapping("Del")
    @ResponseBody
    public Map<String,String> DelInfo(String worker_id,String worker_dept){
        LeaderDao ld = new LeaderDaoImp();
        Map<String,String> data = new HashMap<String,String>();
        if(ld.DelInfo(worker_id)){
            data.put("msg","1");
        }else {
            data.put("msg","0");
        }
        return data;
    }


}
