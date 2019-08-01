package servlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class MenuList
 */
public class MenuList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenuList() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		ServletOutputStream out= response.getOutputStream();
		String branch=request.getParameter("branch");
		ResultSet rs= DAO.listMenu(branch);
		ArrayList<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
		String json="";
		try
		{
			while(rs!=null && rs.next())
			{
				Map<String, Object> m=new HashMap<String, Object>();
				m.put("ID", rs.getInt("id"));
				m.put("Name", rs.getString("menuname"));
				list.add(m);
			}
			json=new Gson().toJson(list);
			out.print(json);
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}

}
