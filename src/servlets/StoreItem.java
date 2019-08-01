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
 * Servlet implementation class StoreItem
 */
@MultipartConfig(maxFileSize=999999999)
public class StoreItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreItem() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String item_name=request.getParameter("item_name");
		String item_description=request.getParameter("item_description");
		int item_category=Integer.parseInt(request.getParameter("item_category"));
		int item_unit=Integer.parseInt(request.getParameter("item_unit"));
		double item_price=Double.parseDouble(request.getParameter("item_price"));
		String item_delivery_type=request.getParameter("item_delivery_type");
		Part p=request.getPart("logo");
		InputStream is=null;
		if(p!=null)
		{
			is=p.getInputStream();
		}
		if(DAO.addItem(item_name, item_description, item_price, item_category, item_delivery_type, item_unit,is))
		{
			response.sendRedirect("items.jsp?id="+item_category);
		}
	}

}
