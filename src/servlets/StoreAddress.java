package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StoreAddress
 */
public class StoreAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreAddress() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		int address_branch=Integer.parseInt(request.getParameter("branch"));
		String address_line1=request.getParameter("address_line1");
		String address_line2=request.getParameter("address_line2");
		double address_longitude=(request.getParameter("address_longitude")==null)?0:Double.valueOf(request.getParameter("address_longitude"));
		double address_latitude=(request.getParameter("address_latitude")==null)?0:Double.valueOf(request.getParameter("address_latitude"));
		System.out.println(request.getParameter("address_city"));
		int address_city=Integer.parseInt(request.getParameter("address_city"));
		if(address_city!=0)
		{
			if(DAO.addAddress(address_branch, address_line1, address_line2, address_longitude, address_latitude, address_city))
			{
				response.sendRedirect("address.jsp?id="+address_branch);
			}
		}
		
	}

}
