package domain;


import lombok.Getter;
import lombok.Setter;


@Setter@Getter
public class Worker {
    private String worker_id;       //员工ID
    private String worker_name;     //员工姓名
    private String worker_pwd;      //员工密码
    private String worker_phone;    //员工密码
    private String worker_email;    //员工邮箱
    private String worker_position;     //员工职务
    private String worker_dept;     //部门
    private String worker_address;  //地址
    private String worker_gen;      //员工性别
    private String worker_IDNUM; //身份证号
    private long worker_age;        //员工年龄


    @Override
    public String toString() {
        return "Worker{" +
                "worker_id='" + worker_id + '\'' +
                ", worker_name='" + worker_name + '\'' +
                ", worker_pwd='" + worker_pwd + '\'' +
                ", worker_phone='" + worker_phone + '\'' +
                ", worker_email='" + worker_email + '\'' +
                ", worker_position='" + worker_position + '\'' +
                ", worker_dept='" + worker_dept + '\'' +
                ", worker_address='" + worker_address + '\'' +
                ", worker_gen='" + worker_gen + '\'' +
                ", worker_IDNUM='" + worker_IDNUM + '\'' +
                ", worker_age=" + worker_age +
                '}';
    }
}
