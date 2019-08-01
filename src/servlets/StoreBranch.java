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
 * Servlet implementation class StoreBranch
 */
@MultipartConfig(maxFileSize=999999999)
public class StoreBranch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreBranch() {
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
		response.setContentType("text/html");
		String branch_name=request.getParameter("branch_name");
		int branch_restaurant=Integer.parseInt(request.getParameter("restaurant"));
		String branch_email=request.getParameter("branch_email");
		String branch_phone=request.getParameter("branch_phone");
		String branch_website=request.getParameter("branch_website");
		boolean branch_status=Boolean.valueOf(request.getParameter("branch_status"));
		Part p=request.getPart("logo");
		InputStream is= p.getInputStream();
		if(DAO.addBranch(branch_name, branch_restaurant,branch_email,branch_phone,branch_website,branch_status,is))
		{
			response.sendRedirect("branches.jsp?id="+branch_restaurant);
		}
	}

}
