package checkHospitail;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

public class Add_Hospital extends BodyTagSupport{
	@Override
	public int doStartTag() throws JspException {
		// TODO Auto-generated method stub
		return EVAL_BODY_BUFFERED;
	}
	@Override
	public int doEndTag() throws JspException {
		// TODO Auto-generated method stub
		String body = bodyContent.getString();
		String[] values = body.split(" ");
		String name = values[0].trim();
		String city = values[1].trim();
		String hospitaltype = values[2].trim();
		String email = values[3].trim();
		String phoneno = values[4].trim();
		String status = values[5].trim();
		JspWriter out = pageContext.getOut();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital",
					"root", "12345");
			String cmd = "Insert into Hospital(HospitalName, City, HospitalType, Email, PhoneNo, status)values(?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(cmd);
			pst.setString(1, name);
			pst.setString(2, city);
			pst.setString(3, hospitaltype);
			pst.setString(4, email);
			pst.setString(5, phoneno);
			pst.setString(6, status);
			pst.executeUpdate();
			out.println("<center>");
			out.println("<h2>");
			out.println("Hospital Record Inserted...</br>");
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
		return EVAL_PAGE;
	}

}
