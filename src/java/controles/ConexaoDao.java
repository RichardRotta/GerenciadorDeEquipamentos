package controles;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Date;
public class ConexaoDao{
    
public boolean cadastrar(Produto p_cad) throws ClassNotFoundException{ 

    String sql_INSERT = "INSERT INTO produto (nome,valor,fabricacao) VALUES(?, ?, ?)";

    try {
        Connection conn = ConectarDao.conectar();
      
        PreparedStatement sql_comando = conn.prepareStatement(sql_INSERT);
        
        
        sql_comando.setString(1, p_cad.getNome());
        sql_comando.setFloat(2, p_cad.getValor());
        sql_comando.setDate(3, new Date(p_cad.getFabrica().getTime())); // Define a data usando java.sql.Date
        sql_comando.executeUpdate();
        conn.close();

        return true;
    } catch (SQLException ex) {
         System.out.println("<br> Erro:" + ex);
         return false;
    }
}

}