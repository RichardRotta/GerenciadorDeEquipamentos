//Derick felipe
package controles;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Date;
public class ComponentesDAO{
    
//Classes boolean para estabelecer os metodos de conexao DAO de cada ação

public boolean addComp(Componentes p_comp) throws ClassNotFoundException{ 
    //INSERT INTO componentes(data_hora,switch, porta_switch, patch_painel, porta_patchpainel, end_mac, nome_pc, end_ip, estado, obs)
    String sql_INSERT = "INSERT INTO componentes(data_hora, switch, porta_switch, patch_painel, porta_patchpainel, end_mac, nome_pc, end_ip, estado, obs)VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    try {
        Connection conn = ConexaoBancoDAO.conectar();
      
        PreparedStatement sql_comando = conn.prepareStatement(sql_INSERT);
        
        //Atribui o comando ao banco
        sql_comando.setDate(1, new Date(p_comp.getData().getTime())); // Define a data usando java.sql.Date
        sql_comando.setString(2, p_comp.getNomeSwitch());
        sql_comando.setInt(3, p_comp.getPortaSwitch());
        sql_comando.setString(4, p_comp.getPatchPanel());
        sql_comando.setInt(5, p_comp.getPortaPatchPanel());
        sql_comando.setString(6, p_comp.getEndMac());
        sql_comando.setString(7, p_comp.getNomePC());
        sql_comando.setString(8, p_comp.getEndIP());
        sql_comando.setString(9, p_comp.getEstado());
        sql_comando.setString(10, p_comp.getObservacao());


        sql_comando.executeUpdate(); //executa o comando SQL
        conn.close();

        return true;

    } catch (SQLException ex) {
         System.out.println("<br> Erro:" + ex);
         return false;
    }
}
public boolean AltComp(HistoricoAlt p_altComp) throws ClassNotFoundException{ 
    //INSERT INTO componentes(data_hora,switch, porta_switch, patch_painel, porta_patchpainel, end_mac, nome_pc, end_ip, estado, obs)
    String sql_INSERT = "INSERT INTO historico_alt(data_hora, switch, porta_switch, patch_painel, porta_patchpainel, end_mac, nome_pc, end_ip, estado, obs)VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    try {
        Connection conn = ConexaoBancoDAO.conectar();
      
        PreparedStatement sql_comando = conn.prepareStatement(sql_INSERT);
        
        //Atribui o comando ao banco
        sql_comando.setDate(1, new Date(p_altComp.getData_alt().getTime())); // Define a data usando java.sql.Date
        sql_comando.setString(2, p_altComp.getNomeSwitch_alt());
        sql_comando.setInt(3, p_altComp.getPortaSwitch_alt());
        sql_comando.setString(4, p_altComp.getPatchPanel_alt());
        sql_comando.setInt(5, p_altComp.getPortaPatchPanel_alt());
        sql_comando.setString(6, p_altComp.getEndMac_alt());
        sql_comando.setString(7,p_altComp.getNomePC_alt());
        sql_comando.setString(8, p_altComp.getEndIP_alt());
        sql_comando.setString(9, p_altComp.getEstado_alt());
        sql_comando.setString(10, p_altComp.getObservacao_alt());


        sql_comando.executeUpdate(); //executa comando SQL
        conn.close();

        return true;
    } catch (SQLException ex) {
         System.out.println("<br> Erro:" + ex);
         return false;
    }
}
public boolean DelComp(HistoricoDel p_delComp) throws ClassNotFoundException{ 
    //INSERT INTO componentes(data_hora,switch, porta_switch, patch_painel, porta_patchpainel, end_mac, nome_pc, end_ip, estado, obs)
    String sql_INSERT = "INSERT INTO historico_del(data_hora, switch, porta_switch, patch_painel, porta_patchpainel, end_mac, nome_pc, end_ip, estado, obs)VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    try {
        Connection conn = ConexaoBancoDAO.conectar();
      
        PreparedStatement sql_comando = conn.prepareStatement(sql_INSERT);
        
        //Atribui o comando ao banco
        sql_comando.setDate(1, new Date(p_delComp.getData_del().getTime())); // Define a data usando java.sql.Date
        sql_comando.setString(2, p_delComp.getNomeSwitch_del());
        sql_comando.setInt(3, p_delComp.getPortaSwitch_del());
        sql_comando.setString(4, p_delComp.getPatchPanel_del());
        sql_comando.setInt(5, p_delComp.getPortaPatchPanel_del());
        sql_comando.setString(6, p_delComp.getEndMac_del());
        sql_comando.setString(7,p_delComp.getNomePC_del());
        sql_comando.setString(8, p_delComp.getEndIP_del());
        sql_comando.setString(9, p_delComp.getEstado_del());
        sql_comando.setString(10, p_delComp.getobservacao_del());


        sql_comando.executeUpdate(); //executa comando SQL
        conn.close();

        return true;
    } catch (SQLException ex) {
         System.out.println("<br> Erro:" + ex);
         return false;
    }
}
}
