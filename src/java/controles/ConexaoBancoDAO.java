package controles;

import java.sql.*;
import java.lang.*;


public class ConexaoBancoDAO {
private static String servidor = "localhost:3306";
private static String banco = "switchManager";


// Método para estabelecer conexão com o banco de dados
public static Connection conectar() throws ClassNotFoundException {
    try {
       Class.forName("com.mysql.cj.jdbc.Driver"); // Driver para MySQL -- Registra a Dll 
       
        String url = "jdbc:mysql://" + servidor + "/" + banco;
    
        return DriverManager.getConnection(url,"root", "");
        
    } catch (SQLException ex) {
       
      return null;
      
    }
}
}

/*--
Class.forName("com.mysql.cj.jdbc.Driver"); // Driver para MySQL -- Registra a Dll
                String url = "jdbc:mysql://localhost:3306/fabrica"; // Determina o servidor e banco(DB)
                Connection conexao = DriverManager.getConnection(url, "root", "");           

                Statement stmt = conexao.createStatement(); // Criar uma instrução com base na conexão. 
                
                /*-- "INSERT INTO produto(nome, valor, fabricacao) VALUES ('Suco Verde', 10.50, '2023/05/23')" --
                String sql = "INSERT INTO produto(nome, valor, fabricacao) VALUES ('" + 
                                                    prod.getNome() + "', " + prod.getValor() + ", '" + s_dt_fab + "')";            
                
                /*-- out.println("<br> <br>SQL: " + sql); 
                stmt.executeUpdate(sql);
                stmt.close(); --*/


