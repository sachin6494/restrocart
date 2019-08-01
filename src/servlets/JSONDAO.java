package servlets;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JSONDAO 
{
	static Connection con;	
	static
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restrokart","root","");
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	public static ResultSet register(String firstname,String lastname,String phone,String imei,String email,String password)
	{
		try
		{
			PreparedStatement ps=con.prepareStatement("insert into user(firstname,lastname,phone,imei,email,password) values(?,?,?,?,?,?)");
			ps.setString(1,firstname);
			ps.setString(2,lastname);
			ps.setString(3, phone);
			ps.setString(4, imei);
			ps.setString(5, email);
			ps.setString(6, password);
			
			if(ps.executeUpdate()>0)
			{
				ps=con.prepareStatement("select last_insert_id()");
				return ps.executeQuery();
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return null;
	}
	public static ResultSet validate(String deviceid)
	{
		try
		{
			PreparedStatement ps=con.prepareStatement("SELECT * from user where imei=? and status=1");
			ps.setString(1,deviceid);
			
			return ps.executeQuery();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return null;
	}
	public static ResultSet validate(String email,String password)
	{
		try
		{
			PreparedStatement ps=con.prepareStatement("SELECT * from user where email=? and password=?");
			ps.setString(1,email);
			ps.setString(2,password);
			return ps.executeQuery();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return null;
	}
	public static ResultSet listBranchByCity(int cityid)
	{
		try
		{
			PreparedStatement ps=con.prepareStatement("SELECT b.id,b.branch_name,b.branch_email,b.branch_phone,a.address_line1,a.address_line2 from branch b join address a on b.id=a.address_branch where address_city=?");
			ps.setInt(1,cityid);
			return ps.executeQuery();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return null;
	}
	public static ResultSet listCities(int state_id)
	{
		try
		{
			PreparedStatement ps=con.prepareStatement("select * from city where city_state=?");
			ps.setInt(1, state_id);
			return ps.executeQuery();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return null;
	}
	public static ResultSet listStates()
	{
		try
		{
			PreparedStatement ps=con.prepareStatement("select * from state");		
			return ps.executeQuery();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return null;
	}
	public static ResultSet listMenus(int branch_id)
	{
		try
		{
			PreparedStatement ps=con.prepareStatement("select * from menu where menu_branch=?");
			ps.setInt(1, branch_id);
			return ps.executeQuery();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return null;
	}
	public static ResultSet listItems(int menu_id)
	{
		try
		{
			PreparedStatement ps=con.prepareStatement("select i.id,i.item_name,i.item_description,i.item_price,i.item_delivery_type,m.menu_name,u.unit_name from items i join menu m on i.item_category=m.id join unit u on i.item_unit=u.id where m.id=?");			
			ps.setInt(1, menu_id);
			return ps.executeQuery();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return null;
	}
}
