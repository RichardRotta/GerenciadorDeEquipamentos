//Derick felipe
package controles;

import java.util.Date;

//Classe HistoricoAlt:
public class HistoricoAlt {
    //Atributos
    private int id_alt;
    private Date data_alt;
    private String nomeSwitch_alt;
    private int portaSwitch_alt;
    private String patchPanel_alt;
    private int portaPatchPanel_alt;
    private String endMac_alt;
    private String nomePC_alt;
    private String endIP_alt;
    private String estado_alt;
    private String observacao_alt;
    
    //Métodos - Construtor
    public HistoricoAlt(int id_alt,Date data_alt, String nomeSwitch_alt, int portaSwitch_alt, String patchPanel_alt, int portaPatchPanel_alt,
                    String endMac_alt,String nomePC_alt, String endIP_alt, String estado_alt, String observacao_alt) 
    {
        this.id_alt = id_alt;
        this.data_alt = data_alt;
        this.nomeSwitch_alt = nomeSwitch_alt;
        this.portaSwitch_alt = portaSwitch_alt;
        this.patchPanel_alt = patchPanel_alt;
        this.portaPatchPanel_alt = portaPatchPanel_alt;
        this.endMac_alt = endMac_alt;
        this.nomePC_alt = nomePC_alt;
        this.endIP_alt = endIP_alt;
        this.estado_alt = estado_alt;
        this.observacao_alt= observacao_alt;
    }
    // Métodos Getters
    public int getId_alt() {return id_alt;}
    public Date getData_alt() {return data_alt;} 
    public String getNomeSwitch_alt() {return nomeSwitch_alt;}
    public int getPortaSwitch_alt() {return portaSwitch_alt;}
    public String getPatchPanel_alt(){return patchPanel_alt;}
    public int getPortaPatchPanel_alt() {return portaPatchPanel_alt;}
    public String getEndMac_alt(){return endMac_alt;}
    public String getNomePC_alt(){return nomePC_alt;}
    public String getEndIP_alt(){return endIP_alt;}
    public String getEstado_alt(){return estado_alt;}
    public String getobservacao_alt(){return observacao_alt;}

    // Métodos Setters       
    public void setId_alt(int id_alt) {this.id_alt = id_alt;}
    public void setData_alt(Date data_alt) {this.data_alt = data_alt;}
    public void setNomeSwitch_alt(String nomeSwitch_alt) {this.nomeSwitch_alt = nomeSwitch_alt;}
    public void setPortaSwitch_alt(int portaSwitch_alt) {this.portaSwitch_alt = portaSwitch_alt;}
    public void setPatchPanel_alt(String patchPanel_alt) {this.patchPanel_alt = patchPanel_alt;}
    public void setPortaPatchPanel_alt(int portaPatchPanel_alt) {this.portaPatchPanel_alt = portaPatchPanel_alt;}
    public void setEndMac_alt(String endMac_alt) {this.endMac_alt = endMac_alt;}
    public void setNomePC_alt(String nomePC_alt) {this.nomePC_alt = nomePC_alt;}
    public void setEndIP_alt(String endIP_alt) {this. endIP_alt =  endIP_alt;}
    public void setEstado_alt(String estado_alt) {this.estado_alt = estado_alt;}
    public void setobservacao_alt(String observacao_alt) {this.observacao_alt = observacao_alt;}


    
   
}