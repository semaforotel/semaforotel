
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

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class BDPeso {

    private String dbUrl = "jdbc:postgresql://127.0.0.1:5432/database?user=lucio&password=lucio";

    private int NUM_REGISTROS=1877;

    private String ARQ_SAIDA = "biolar_peso_output_31_03_2018.txt";
    
    public BDPeso(){

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

		    connection = DriverManager.getConnection(dbUrl);

		} catch (SQLException e) {

			System.out.println("Connection Failed! Check output console");
			e.printStackTrace();
			return;

		}

		if (connection != null) {
			System.out.println("You made it, take control your database now!");

			String [] listaRepetidos = new String [600000];
			iniciarLista(listaRepetidos);			
			
			//////
			int id=0;
			int num=0;
			while(num<NUM_REGISTROS){
			    try {
				StringBuffer conteudo = new StringBuffer();
				
				Statement stmt = connection.createStatement();			    
				ResultSet rs = stmt.executeQuery("SELECT nome FROM avaliacao where id="+id);
				String nome="";
				String valor=""; //campo recuperado da consulta
				if (rs.next()){
				    nome = (String) rs.getObject(1);

				    if (!repetido(nome, listaRepetidos)){
					conteudo.append(nome);
					System.out.print(nome);
					rs = stmt.executeQuery("SELECT peso,dataavaliacao FROM avaliacao where nome='"+nome+"' ORDER BY to_date(dataavaliacao,'DD/MM/YYYY') asc");
					
					while (rs.next()) {
					    valor=","+rs.getObject(1);
					    conteudo.append(valor);
					    System.out.print(valor);
					    
					    //valor=","+rs.getObject(2);
					    //conteudo.append(valor);
					    //System.out.print(valor);
					}				    
					conteudo.append("\n");
					System.out.println();
					gravar(conteudo);
				    }//fim if
				}//
			    } catch (Exception e){
				e.printStackTrace();
				System.out.println(e.getMessage());
			    }
			    id++;
			    num++;
			}
		} else {
			System.out.println("Failed to make connection!");
		}
    }//

    public void iniciarLista(String [] listaRepetidos){

	int i=0;
	while(i<listaRepetidos.length){
	    listaRepetidos[i]="";
	    i++;
	}
    }//fim iniciarLista
    
    public Boolean repetido(String nome, String [] listaRepetidos){

	Boolean repetido = false;

	int i=0;
	while(!repetido && i<listaRepetidos.length && !listaRepetidos[i].equals("")){
	    if (listaRepetidos[i].equals(nome))
		repetido=true;
	    i++;
	}
	i=0;
	if (!repetido)
	    while(!listaRepetidos[i].equals(""))
		i++;
	listaRepetidos[i]=nome;
	
	return repetido;
	
    }
    
    public StringBuffer gravar(StringBuffer conteudo) {

        try {
            //Grava o conteudo 
            BufferedWriter out = new BufferedWriter(new FileWriter(ARQ_SAIDA, true));
            out.write(conteudo.toString());
            conteudo = new StringBuffer();
            out.close();
        } catch (Exception e) {
            System.out.println("Excecao2: Erro ao gravar no arquivo." + e.getMessage());
        }//fim catch			

        return conteudo;

    }
    
    public static void main(String[] argv) {
	new BDPeso();	    
    }
}//fim classe
