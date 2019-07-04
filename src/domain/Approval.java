package domain;

import lombok.Getter;
import lombok.Setter;

@Setter@Getter
public class Approval {

    private int worker_approval_id; //审批编号
    private String worker_id;
    private String worker_name;
    private String worker_approval; //审批标题
    private String worker_date;     //审批日期
    private String worker_reason;   //审批原因
    private String worker_status;   //审批状态
    private String worker_dept;
    private String worker_address;

    @Override
    public String toString() {
        return "Approval{" +
                "worker_approval_id=" + worker_approval_id +
                ", worker_id='" + worker_id + '\'' +
                ", worker_name='" + worker_name + '\'' +
                ", worker_approval='" + worker_approval + '\'' +
                ", worker_date='" + worker_date + '\'' +
                ", worker_reason='" + worker_reason + '\'' +
                ", worker_status='" + worker_status + '\'' +
                ", worker_dept='" + worker_dept + '\'' +
                ", worker_address='" + worker_address + '\'' +
                '}';
    }
}
