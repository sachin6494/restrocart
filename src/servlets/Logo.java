package servlets;

import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Logo
 */
public class Logo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Logo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try
		{
			response.setContentType("image/png");
			ServletOutputStream out=response.getOutputStream();
			int id=Integer.parseInt(request.getParameter("rid"));
			String source=request.getParameter("source");
			ResultSet rs=DAO.getLogo(source, id);
			if(rs!=null && rs.next())
			{
				InputStream is=rs.getBinaryStream("logo");
				byte []b=new byte[is.available()];
				is.read(b);
				out.write(b);;
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
