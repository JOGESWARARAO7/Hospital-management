package checkHospitail;

import java.io.IOException;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Random;
import java.util.SplittableRandom;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import com.google.protobuf.Message;

public class AddAdmin extends BodyTagSupport{
	
	 
	    public int doStartTag() throws JspException {
	        return EVAL_BODY_BUFFERED;
	    }

	    @Override
	    public int doEndTag() throws JspException {
	    	try {
				Class.forName("com.mysql.cj.jdbc.Driver");
		        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "12345");
	        String body = bodyContent.getString();
	        String[] values = body.split(" ");
	        int hospitalId = Integer.parseInt(values[0].trim());
	        String userName = values[1].trim();
	        String passcode = values[2].trim();
	        String otpPurpose = values[3].trim();
	        String status = values[4].trim();

	        JspWriter out = pageContext.getOut();
	            
	            	
		                
		                // Check if the number of admins for the hospital is less than 3
		                PreparedStatement pst = conn.prepareStatement("SELECT COUNT(HospitalId) FROM Admin WHERE HospitalId = ?");
		                    pst.setInt(1, hospitalId);
		                    ResultSet rs = pst.executeQuery();
		                    if (rs.next() && rs.getInt(1)>=3) {
		                        out.println("Cannot add more than 3 admins hospital.");
		                        return EVAL_PAGE;
		                    }

				 

	                // Insert new admin
	                
	                	
	                		String otp = generateOtp();
	    	                System.out.println(otp);
	                		pst = conn.prepareStatement("INSERT INTO Admin(HospitalId, UserName, Passcode, Otp, OtpPurpose, Status) VALUES (?, ?, ?, ?, ?, ?)");
							pst.setInt(1, hospitalId);
		                    pst.setString(2, userName);
		                    pst.setString(3, passcode);
		                    pst.setString(4, otp);
		                    pst.setString(5, otpPurpose);
		                    pst.setString(6, status);
		                    String subject="hospatal";
			                String tomail=getHospitalEmail(hospitalId);
			                String result=mail(tomail,subject, otp);
			                if(result=="Successfully") {
			                	out.println("<center>");
			                	out.println("<h2>");
				                out.println("OTP sent  to mail sent...</br>");
				                pst.executeUpdate();
				                out.println("Insert data sucessfully </br>");
				                out.println("</h2>");
				                out.println("</center>");
				                return EVAL_PAGE; 
				            }
			                else{
			                	out.println("<center>");
			                	out.println("<h2>");
			                	out.println("Email is not a valid </br>");
			                	out.println("</h2>");
				                out.println("</center>");
			                	return EVAL_PAGE; 
			                }
		                   
						
	    	} catch (Exception e) {
	    		e.printStackTrace();
				// TODO: handle exception
			}
	                   
	    	return EVAL_PAGE;         
	                
	                
	    }


	    private String generateOtp() {
	    	Random random = new Random();
	        int otp = 100000 + random.nextInt(900000); // Generate a 6-digit OTP
	        return String.valueOf(otp);
	    }

	    public static String mail(String toEmail, String subject, String body) {
			 
	        String from = "prasanna.trainer@gmail.com";

	        // Assuming you are sending email from through gmails smtp
	        String host = "smtp.gmail.com";

	        // Get system properties
	        Properties properties = System.getProperties();

	        // Setup mail server
	        properties.put("mail.smtp.host", host);
	        properties.put("mail.smtp.port", "465");
	        properties.put("mail.smtp.ssl.enable", "true");
	        properties.put("mail.smtp.auth", "true");

	        // Get the Session object.// and pass username and password
	        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

	            protected PasswordAuthentication getPasswordAuthentication() {

	                return new PasswordAuthentication("prasanna.vsp80@gmail.com", "soqdhechjkcchkgl");

	            }

	        });
	        session.setDebug(true);

	        try {
	            MimeMessage message = new MimeMessage(session);
	            message.setFrom(new InternetAddress(from));

	            // Set To: header field of the header.
	            message.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(toEmail));

	            // Set Subject: header field
	            message.setSubject(subject);

	            message.setText(body);

	            System.out.println("sending...");
	            // Send message
	            Transport.send(message);
	            System.out.println("Sent message successfully....");
	            return "Successfully";
	        } catch (MessagingException mex) {
	            mex.printStackTrace();
	            return mex.getMessage();
	        }

		}

		
	    private String getHospitalEmail(int hospitalId) throws SQLException, ClassNotFoundException {
	        String emailid = null;
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "12345");
	             PreparedStatement pst = conn.prepareStatement("select email from hospital where hospitalid = ?")) {
	            pst.setInt(1, hospitalId);
	            ResultSet rs = pst.executeQuery();
	            if (rs.next()) {
	                emailid = rs.getString("Email");
	            }
	        }
	        return emailid;
	    }

	    
}
