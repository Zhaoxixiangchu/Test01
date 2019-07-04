package controller;

import Dao.LeaderDao;
import Dao.LeaderDaoImp;
import Dao.WorkerDao;
import Dao.WorkerDaoImp;


import domain.Approval;
import domain.Worker;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
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
public class myController {




    @RequestMapping("Login")
    public ModelAndView Login(String user_name, String user_id, String user_pwd, String identify, HttpSession session){

        ModelAndView modelAndView = new ModelAndView();
        WorkerDao wd = new WorkerDaoImp();
        LeaderDao ld = new LeaderDaoImp();
        if(identify.equals("领导")){
            if(ld.Login(user_name,user_id,user_pwd)){
                session.setAttribute("id",user_id);
                modelAndView.addObject("identify",identify);
                session.setAttribute("name",user_name);
//                modelAndView.addObject("name",user_name);
//                modelAndView.setViewName("/Leader.jsp");
                modelAndView.setViewName("/test.jsp");
            }else {
                modelAndView.addObject("flag","false");
                modelAndView.setViewName("/index.jsp");
            }
        }
        if(identify.equals("员工")){
            if(wd.Login(user_name,user_id,user_pwd)){
                session.setAttribute("id",user_id);
                modelAndView.addObject("identify",identify);
                session.setAttribute("name",user_name);
//                modelAndView.setViewName("/Worker.jsp");
                modelAndView.setViewName("/test.jsp");
            }else {
                modelAndView.addObject("flag","false");
                modelAndView.setViewName("/index.jsp");
            }
        }
        return modelAndView;
    }


    @RequestMapping("FindPWD")
    public ModelAndView FindPWD(String user_name,String user_id,String user_pwd,String user_idnum,String identify){
        ModelAndView modelAndView = new ModelAndView();
        WorkerDao wd = new WorkerDaoImp();
        LeaderDao ld = new LeaderDaoImp();
        if(identify.equals("领导")){
            if(ld.FindPWD(user_id,user_name, user_idnum,user_pwd)){
                //修改成功页面返回true
                modelAndView.addObject("flag","true");
                //设置重定向页面
                modelAndView.setViewName("/FindPwd.jsp");
            }else {
                modelAndView.addObject("flag","false");
                modelAndView.setViewName("/FindPwd.jsp");
            }
        }
        if(identify.equals("员工")){
            if(wd.FindPWD(user_id,user_name, user_idnum,user_pwd)){
                //修改成功页面返回true
                modelAndView.addObject("flag","true");
                //设置重定向页面
                modelAndView.setViewName("/FindPwd.jsp");
            }else {
                modelAndView.addObject("flag","false");
                modelAndView.setViewName("/FindPwd.jsp");
            }
        }
        return modelAndView;
    }


    @RequestMapping("Register")
    public ModelAndView Register(String Name,String sex,String Age,String Id,String Email,String Phone,String IDNUM,String Pwd,String Position,String dept,String address){
        WorkerDao wd = new WorkerDaoImp();
        ModelAndView modelAndView = new ModelAndView();
        if(wd.Regist(Name, sex, Age, Id, Email, Phone, IDNUM, Pwd, Position,dept,address)){
            modelAndView.addObject("flag","true");
            modelAndView.setViewName("/Register.jsp");
        }else {
            modelAndView.addObject("flag","false");
            modelAndView.setViewName("/Register.jsp");
        }
        return modelAndView;
    }

    @RequestMapping("WorkInfo")
    public ModelAndView WorkerInfo(String user_id,Model model){
        WorkerDao wd = new WorkerDaoImp();
        List<Worker> list = wd.WorkerInfo(user_id);
        ModelAndView modelAndView = new ModelAndView();
        model.addAttribute("list",list);
        modelAndView.setViewName("WorkInfo.jsp");
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping("EditWorker")
    public Map<String,String> EditWorker(Worker worker, HttpSession session, HttpServletRequest request, HttpServletResponse response){
//        System.out.println(worker);
        WorkerDao ws = new WorkerDaoImp();
        Worker worker1 = ws.EditWorker(worker);
        Map<String,String> data = new HashMap<String,String>();
        if(worker1!=null){
            session.setAttribute("list",worker1);
            data.put("msg","1");
        }else {
            data.put("msg","0");
        }
        return data;
    }

    @RequestMapping("Approval")
    public ModelAndView Approval(){
        WorkerDao wd = new WorkerDaoImp();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("ApprovalInfo.jsp");
        return modelAndView;
    }

    @RequestMapping("Appr")
    @ResponseBody
    public Map<String,Object> ShowAppro(String user_id,int page,int limit){
        WorkerDao wd = new WorkerDaoImp();
//        ApplicationContext applicationContext= new ClassPathXmlApplicationContext("applicationContext.xml");
//        WorkerDao wd1 = (Dao.WorkerDaoImp) applicationContext.getBean("WorkerDaoImp");
        List<Approval> list = wd.ApprovalInfo(user_id);
        List<Approval> list1 = wd.ApprovalCounts(user_id,page,limit);
        Map<String,Object> tableData = new LinkedHashMap<String, Object>();
        tableData.put("code",0);
        tableData.put("msg","");
        tableData.put("count",list.size());
        tableData.put("data",list1);
        return tableData;
    }

    @RequestMapping("InsertApproval")
    @ResponseBody
    public Map<String,Object> InsertApproval(String worker_id,String worker_approval,String worker_name,String worker_dept,String worker_address,String worker_reason,String worker_date){
        WorkerDao wd = new WorkerDaoImp();
        Map<String,Object> tableData = new LinkedHashMap<String, Object>();
        if(wd.InsertApproval(worker_id,worker_approval,worker_name,worker_dept,worker_address,worker_reason,worker_date)){
            tableData.put("msg","1");
        }else {
            tableData.put("msg","0");
        }
        return tableData;
    }
}
