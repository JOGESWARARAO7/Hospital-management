package checkHospitail;

public class Hospital {

	private int hospitalid;
	private String hospitalname;
	private String city;
	private String hospitaltype;
	private String email ;
	private String phoneno;
	private String status;
	public int getHospitalid() {
		return hospitalid;
	}
	public void setHospitalid(int hospitalid) {
		this.hospitalid = hospitalid;
	}
	public String getHospitalname() {
		return hospitalname;
	}
	public void setHospitalname(String hospitalname) {
		this.hospitalname = hospitalname;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getHospitaltype() {
		return hospitaltype;
	}
	public void setHospitaltype(String hospitaltype) {
		this.hospitaltype = hospitaltype;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneno() {
		return phoneno;
	}
	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Hospital() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Hospital(int hospitalid, String hospitalname, String city, String hospitaltype, String email, String phoneno,
			String status) {
		super();
		this.hospitalid = hospitalid;
		this.hospitalname = hospitalname;
		this.city = city;
		this.hospitaltype = hospitaltype;
		this.email = email;
		this.phoneno = phoneno;
		this.status = status;
	}
	@Override
	public String toString() {
		return "Hospital [hospitalid=" + hospitalid + ", hospitalname=" + hospitalname + ", city=" + city
				+ ", hospitaltype=" + hospitaltype + ", email=" + email + ", phoneno=" + phoneno + ", status=" + status
				+ "]";
	}
	
	
}
