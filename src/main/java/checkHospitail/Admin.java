package checkHospitail;

public class Admin {
	private String  adminid;
	private String hospitalid;
	private String username;
	private String passcode;
	private String otp;
	private String otppurpose;
	private String status;
	public String getAdminid() {
		return adminid;
	}
	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}
	public String getHospitalid() {
		return hospitalid;
	}
	public void setHospitalid(String hospitalid) {
		this.hospitalid = hospitalid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPasscode() {
		return passcode;
	}
	public void setPasscode(String passcode) {
		this.passcode = passcode;
	}
	public String getOtp() {
		return otp;
	}
	public void setOtp(String otp) {
		this.otp = otp;
	}
	public String getOtppurpose() {
		return otppurpose;
	}
	public void setOtppurpose(String otppurpose) {
		this.otppurpose = otppurpose;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Admin(String adminid, String hospitalid, String username, String passcode, String otp, String otppurpose,
			String status) {
		super();
		this.adminid = adminid;
		this.hospitalid = hospitalid;
		this.username = username;
		this.passcode = passcode;
		this.otp = otp;
		this.otppurpose = otppurpose;
		this.status = status;
	}
	@Override
	public String toString() {
		return "Admin [adminid=" + adminid + ", hospitalid=" + hospitalid + ", username=" + username + ", passcode="
				+ passcode + ", otp=" + otp + ", otppurpose=" + otppurpose + ", status=" + status + "]";
	}
	
	
	
}
