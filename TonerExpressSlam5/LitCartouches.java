
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class LitCartouches {
	private static final String pilote="oracle.jdbc.driver.OracleDriver";
	private static final String url ="jdbc:oracle:thin:@172.20.64.253:1521:IG2";
	private static Connection cnt;
	
	public static void main(String[] args) 
	{
		boolean encore;
		try {
			Class.forName(pilote);
			cnt = DriverManager.getConnection(url,"scott","tiger");

		//cnt = OracleConnection.getConnection("test","scott","tiger");	
		Statement req = cnt.createStatement();
		
		// Exercice n°2
		int nbModif = req.executeUpdate("update Cartouche set PrixCartouche = PrixCartouche * 1.03");
		System.out.println("Nombre de cartouches modifiées : "+nbModif);
		
		// Exercice n°1
		ResultSet res = req.executeQuery("select * from cartouche");
		encore = res.next();
		System.out.println("\nRéférence\tDésignation\t\tPrix");
		while (encore)
		{
			System.out.println(res.getString(1)+"\t\t"+res.getString(2)+"\t"+res.getDouble(3));
			encore = res.next();
		}
		cnt.close();
		} catch (ClassNotFoundException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
