package servlets;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class StoreRestaurant
 */
@MultipartConfig(maxFileSize=999999999)
public class StoreRestaurant extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreRestaurant() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try
		{
			String res_name=request.getParameter("res_name");
			String res_website=request.getParameter("res_website");
			String res_desc=request.getParameter("res_desc");
			String res_cc1=request.getParameter("res_cc1");
			String res_cc2=request.getParameter("res_cc2");
			Part p=request.getPart("logo");
			InputStream is= p.getInputStream();
			if(DAO.addRestaurant(res_name, res_website,res_desc,res_cc1,res_cc2, is))
			{				
				response.sendRedirect("index.jsp");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}

}







