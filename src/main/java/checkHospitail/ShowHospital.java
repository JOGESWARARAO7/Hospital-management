package checkHospitail;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class ShowHospital extends TagSupport{
	@Override
	public int doStartTag() throws JspException {
		// TODO Auto-generated method stub
		try {
		JspWriter out = pageContext.getOut();
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital",
				"root", "12345");
		String cmd ="select * from hospital";
		PreparedStatement pst = conn.prepareStatement(cmd);
		ResultSet rs = pst.executeQuery();
		Hospital hospital = null;
		List<Hospital> HList = new ArrayList<>();
		while(rs.next()) {
			hospital = new Hospital();
			hospital.setHospitalid(rs.getInt("hospitalid"));
			hospital.setHospitalname(rs.getString("hospitalname"));
			hospital.setCity(rs.getString("city"));
			hospital.setHospitaltype(rs.getString("Hospitaltype"));
			hospital.setEmail(rs.getString("email"));
			hospital.setPhoneno(rs.getString("phoneno"));
			hospital.setStatus(rs.getString("status"));
			HList.add(hospital);
			
		}
		out.println("<center>");
		out.println("<table border='2px'>");
		out.println("<tr>");
		out.println("<th>"+"Hospitalid"+"</th>");
		out.println("<th>"+"hospitalname"+"</th>");
		out.println("<th>"+"city"+"</th>");
		out.println("<th>"+"Hospitaltype"+"</th>");
		out.println("<th>"+"email"+"</th>");
		out.println("<th>"+"phoneno"+"</th>");
		out.println("<th>"+"status"+"</th>");
		out.println("</tr>");
		
		for (Hospital hospital2 : HList) {
			out.println("<tr>");
			out.println("<td>"+hospital2.getHospitalid()+"</td>");
			out.println("<td>"+hospital2.getHospitalname()+"</td>");
			out.println("<td>"+hospital2.getCity()+"</td>");
			out.println("<td>"+hospital2.getHospitaltype()+"</td>");
			out.println("<td>"+hospital2.getEmail()+"</td>");
			out.println("<td>"+hospital2.getPhoneno()+"</td>");
			out.println("<td>"+hospital2.getStatus()+"</td>");
			out.println("</tr>");
		}
		System.out.println("</table>");
		out.println("</center>");
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

		return SKIP_BODY;
	}

}
