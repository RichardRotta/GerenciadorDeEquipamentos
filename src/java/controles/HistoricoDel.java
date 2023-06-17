//Derick felipe
package controles;

import java.util.Date;

//Classe HistoricoDel:
public class HistoricoDel {
    //Atributos
    private int id_del;
    private Date data_del;
    private String nomeSwitch_del;
    private int portaSwitch_del;
    private String patchPanel_del;
    private int portaPatchPanel_del;
    private String endMac_del;
    private String nomePC_del;
    private String endIP_del;
    private String estado_del;
    private String observacao_del;
    
    //Métodos - Construtor
    public HistoricoDel(int id_del,Date data_del, String nomeSwitch_del, int portaSwitch_del, String patchPanel_del, int portaPatchPanel_del,
                    String endMac_del,String nomePC_del, String endIP_del, String estado_del, String observacao_del) 
    {
        this.id_del = id_del;
        this.data_del = data_del;
        this.nomeSwitch_del = nomeSwitch_del;
        this.portaSwitch_del = portaSwitch_del;
        this.patchPanel_del = patchPanel_del;
        this.portaPatchPanel_del = portaPatchPanel_del;
        this.endMac_del = endMac_del;
        this.nomePC_del = nomePC_del;
        this.endIP_del = endIP_del;
        this.estado_del = estado_del;
        this.observacao_del = observacao_del;
    }
    // Métodos Getters
    public int getId_del() {return id_del;}
    public Date getData_del() {return data_del;} 
    public String getNomeSwitch_del() {return nomeSwitch_del;}
    public int getPortaSwitch_del() {return portaSwitch_del;}
    public String getPatchPanel_del(){return patchPanel_del;}
    public int getPortaPatchPanel_del() {return portaPatchPanel_del;}
    public String getEndMac_del(){return endMac_del;}
    public String getNomePC_del(){return nomePC_del;}
    public String getEndIP_del(){return endIP_del;}
    public String getEstado_del(){return estado_del;}
    public String getobservacao_del(){return observacao_del;}

    // Métodos Setters       
    public void setId_del(int id_del) {this.id_del = id_del;}
    public void setData_del(Date data_del) {this.data_del = data_del;}
    public void setNomeSwitch_del(String nomeSwitch_del) {this.nomeSwitch_del = nomeSwitch_del;}
    public void setPortaSwitch_del(int portaSwitch_del) {this.portaSwitch_del = portaSwitch_del;}
    public void setPatchPanel_del(String patchPanel_del) {this.patchPanel_del = patchPanel_del;}
    public void setPortaPatchPanel_del(int portaPatchPanel_del) {this.portaPatchPanel_del= portaPatchPanel_del;}
    public void setEndMac_del(String endMac_del) {this.endMac_del = endMac_del;}
    public void setNomePC_del(String nomePC_del) {this.nomePC_del = nomePC_del;}
    public void setEndIP_del(String endIP_del) {this. endIP_del =  endIP_del;}
    public void setEstado_del(String estado_del) {this.estado_del = estado_del;}
    public void setobservacao_del(String observacao_del) {this.observacao_del = observacao_del;}

    
   
}
