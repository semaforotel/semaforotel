
import java.sql.*;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;

public class BDPostgresql {

	public static void main(String[] argv) {

		System.out.println("-------- PostgreSQL "
				+ "JDBC Connection Testing ------------");

		try {

			Class.forName("org.postgresql.Driver");

		} catch (ClassNotFoundException e) {

			System.out.println("Where is your PostgreSQL JDBC Driver? "
					+ "Include in your library path!");
			e.printStackTrace();
			return;

		}

		System.out.println("PostgreSQL JDBC Driver Registered!");

		Connection connection = null;

		try {

			connection = DriverManager.getConnection(
"jdbc:postgresql://127.0.0.1:5432/database", "lucio","lucio");

		} catch (SQLException e) {

			System.out.println("Connection Failed! Check output console");
			e.printStackTrace();
			return;

		}

		if (connection != null) {
			System.out.println("You made it, take control your database now!");
			//////
			try {
			    Statement stmt = connection.createStatement();
			    stmt.executeUpdate("create table if not exists avaliacao ( id integer primary key, cpf integer, dataAvaliacao varchar(20), dataNascimento varchar(20), idade integer, nome varchar(80), objetivo varchar(80), exercicios varchar(80), outrasAF varchar(80),  especificar varchar(80), diagnostico varchar(80), medicacao varchar(80), peso float, altura float, imc float, fc float )");
			    
			    //stmt.executeUpdate("insert into avaliacao values ( 1, '11/03/2018', '11/03/2018', 12, 'Lucio', 'obj', 'exercicios', 'outrasAF', 'especificar', 'diagnostico', 'medicacao', 1.1, 2.2, 3.3, 4.4 )");
			    
			    ResultSet rs = stmt.executeQuery("SELECT * FROM avaliacao");	    
			    ArrayList<String> output = new ArrayList<String>();			
			    while (rs.next()) {
				System.out.println(rs.getObject(1));
			    }
			} catch (Exception e){
			    e.printStackTrace();
			    System.out.println(e.getMessage());
			}
		} else {
			System.out.println("Failed to make connection!");
		}
	}

}
