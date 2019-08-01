package servlets;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashSet;
import java.util.Set;

public class DAO 
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
	public static boolean addBranch(String branch_name,int branch_restaurant,String branch_email,String branch_phone,String branch_website,boolean branch_status,InputStream is)
	{
		try
		{
			PreparedStatement ps=con.prepareStatement("insert into branch(branch_name,branch_restaurant,branch_email,branch_phone,branch_website,branch_status,logo) values(?,?,?,?,?,?,?)");
			ps.setString(1, branch_name);
			ps.setInt(2, branch_restaurant);
			ps.setString(3, branch_email);
			ps.setString(4, branch_phone);
			ps.setString(5, branch_website);
			ps.setBoolean(6, branch_status);
			ps.setBinaryStream(7, is,is.available());
			
			return ps.executeUpdate()>0;
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return false;
	}
	public static boolean addState(String state_name)
	{
		try
		{
			PreparedStatement ps=con.prepareStatement("insert into state(state_name) values(?)");
			ps.setString(1, state_name);					
			return ps.executeUpdate()>0;
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return false;
	}
	public static boolean addItem(String item_name,String item_description,double item_price,int item_category,String item_delivery_type,int item_unit,InputStream is)
	{
		try
		{
			PreparedStatement ps=con.prepareStatement("insert into items(item_name,item_description,item_price,item_category,item_delivery_type,item_unit,logo) values(?,?,?,?,?,?,?)");
			ps.setString(1, item_name);
			ps.setString(2, item_description);
			ps.setDouble(3, item_price);
			ps.setInt(4, item_category);
			ps.setString(5, item_delivery_type);
			ps.setInt(6, item_unit);
			ps.setBinaryStream(7, is,(is==null)?0:is.available());
			
			return ps.executeUpdate()>0;
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return false;
	}
	public static ResultSet listItems(int menu_id)
	{
		try
		{
			PreparedStatement ps=con.prepareStatement("select i.id,i.item_name,i.item_description,i.item_price,i.item_delivery_type,i.logo,m.menu_name,u.unit_name from items i join menu m on i.item_category=m.id join unit u on i.item_unit=u.id where m.id=?");			
			ps.setInt(1, menu_id);
			return ps.executeQuery();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return null;
	}
	public static ResultSet listMenus(int menu_id)
	{
		try
		{
			PreparedStatement ps=con.prepareStatement("select * from menu where id=?");			
			ps.setInt(1, menu_id);
			return ps.executeQuery();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return null;
	}
	public static ResultSet listMenu(int menu_branch)
	{
		try
		{
			PreparedStatement ps=con.prepareStatement("select * from menu where menu_branch=?");			
			ps.setInt(1, menu_branch);
			return ps.executeQuery();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return null;
	}
	public static ResultSet listUnits()
	{
		try
		{
			PreparedStatement ps=con.prepareStatement("select * from unit");						
			return ps.executeQuery();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return null;
	}
	public static boolean addUnit(String unit_name)
	{
		try
		{
			PreparedStatement ps=con.prepareStatement("insert into unit(unit_name) values(?)");
			ps.setString(1, unit_name);
			
			
			return ps.executeUpdate()>0;
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return false;
	}
	public static boolean addMenu(String menu_name,int menu_branch)
	{
		try
		{
			PreparedStatement ps=con.prepareStatement("insert into menu(menu_name,menu_branch) values(?,?)");
			ps.setString(1, menu_name);
			ps.setInt(2, menu_branch);
			
			return ps.executeUpdate()>0;
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return false;
	}
	public static boolean addAddress(int address_branch,String address_line1,String address_line2,double address_longitude,double address_latitude,int address_city)
	{
		try
		{
			PreparedStatement ps1=con.prepareStatement("delete from address where address_branch=?");			
			ps1.setInt(1,address_branch);
			ps1.executeUpdate();
			
				PreparedStatement ps=con.prepareStatement("insert into address(address_branch,address_line1,address_line2,address_longitude,address_latitude,address_city) values(?,?,?,?,?,?)");		
				ps.setInt(1, address_branch);
				ps.setString(2, address_line1);
				ps.setString(3, address_line2);
				ps.setDouble(4, address_longitude);
				ps.setDouble(5, address_latitude);
				ps.setInt(6, address_city);			
				return ps.executeUpdate()>0;
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return false;
	}
	public static boolean addCity(String city_name,int state_id)
	{
		try
		{
			PreparedStatement ps=con.prepareStatement("insert into city(city_name,city_state) values(?,?)");
			ps.setString(1, city_name);
			ps.setInt(2, state_id);
			
			return ps.executeUpdate()>0;
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return false;
	}
	public static boolean addRestaurant(String res_name,String res_website,String res_desc,String res_cc1,String res_cc2,InputStream is)
	{
		try
		{
			PreparedStatement ps=con.prepareStatement("insert into restaurants(res_name,res_website,res_desc,res_cc1,res_cc2,logo) values(?,?,?,?,?,?)");
			ps.setString(1, res_name);
			ps.setString(2, res_website);
			ps.setString(3, res_desc);
			ps.setString(4, res_cc1);
			ps.setString(5, res_cc2);
			ps.setBinaryStream(6, is,is.available());
			return ps.executeUpdate()>0;
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return false;
	}
	public static ResultSet listAddress(int address_branch)
	{
		try
		{
			PreparedStatement ps=con.prepareStatement("select a.id,c.id city,a.address_line1,a.address_line2,a.address_longitude,a.address_latitude,c.city_name,s.state_name,b.branch_name from address a join city c on a.address_city=c.id join state s on s.id=c.city_state join branch b on a.address_branch=b.id where b.id=?");			
			ps.setInt(1, address_branch);
			return ps.executeQuery();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return null;
	}
	public static ResultSet listCities(int address_state)
	{
		try
		{
			PreparedStatement ps=con.prepareStatement("select c.id,s.state_name,c.city_name from city c join state s on s.id=c.city_state where c.city_state=?");	
			ps.setInt(1, address_state);
			return ps.executeQuery();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return null;
	}
	public static ResultSet listCities()
	{
		try
		{
			PreparedStatement ps=con.prepareStatement("select c.id,s.state_name,c.city_name from city c join state s on s.id=c.city_state");			
			return ps.executeQuery();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return null;
	}
	public static ResultSet listStates(int id)
	{
		try
		{
			PreparedStatement ps=con.prepareStatement("select * from state where id=?");
			ps.setInt(1, id);
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
	public static ResultSet listMenu(String branch)
	{
		try
		{
			PreparedStatement ps=con.prepareStatement("select * from menu where branch=?");
			ps.setString(1, branch);
			return ps.executeQuery();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return null;
	}
	public static ResultSet listBranches(int branch_restaurant)
	{
		try
		{
			PreparedStatement ps=con.prepareStatement("select id,branch_name,branch_email,branch_phone,branch_website,branch_status,logo from branch where branch_restaurant=?");
			ps.setInt(1, branch_restaurant);
			return ps.executeQuery();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return null;
	}
	public static ResultSet getBranch(int id)
	{
		try
		{
			PreparedStatement ps=con.prepareStatement("select id,branch_name,branch_email,branch_phone,branch_website,branch_status,logo from branch where id=?");
			ps.setInt(1, id);
			return ps.executeQuery();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return null;
	}
	public static ResultSet getLogo(String source,int id)
	{
		try
		{
			PreparedStatement ps=con.prepareStatement("select logo from "+source+" where id=?");
			ps.setInt(1, id);
			return ps.executeQuery();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return null;
	}
	public static ResultSet listBranches()
	{
		try
		{
			PreparedStatement ps=con.prepareStatement("select * from branch");
			
			return ps.executeQuery();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return null;
	}
	public static ResultSet listRestaurants()
	{
		try
		{
			PreparedStatement ps=con.prepareStatement("select * from restaurants");
			return ps.executeQuery();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return null;
	}
	public static ResultSet listRestaurants(int id)
	{
		try
		{
			PreparedStatement ps=con.prepareStatement("select * from restaurants where id=?");
			ps.setInt(1, id);
			return ps.executeQuery();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return null;
	}
}










