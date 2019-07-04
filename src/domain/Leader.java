package domain;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Email;

import javax.validation.constraints.Pattern;

@Setter@Getter
public class Leader {
    private String leader_id; //领导ID
    private String leader_name; //领导姓名
    private String leader_pwd;  //领导密码
    private String leader_phone;      //领导电话
    private String leader_email;    //领导邮箱
    private String leader_position; //职务
    private Long leader_age; //年龄
    private String leader_gen;  //性别
    private String leader_IDNUM; //身份证号

    @Override
    public String toString() {
        return "Leader{" +
                "leader_id='" + leader_id + '\'' +
                ", leader_name='" + leader_name + '\'' +
                ", leader_pwd='" + leader_pwd + '\'' +
                ", leader_phone='" + leader_phone + '\'' +
                ", leader_email='" + leader_email + '\'' +
                ", leader_position='" + leader_position + '\'' +
                ", leader_age='" + leader_age + '\'' +
                ", leader_gen='" + leader_gen + '\'' +
                ", leader_IDNUM='" + leader_IDNUM + '\'' +
                '}';
    }



}
