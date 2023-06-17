//Derick felipe
package controles;

import java.util.Date;

//Classe componentes:
public class Componentes {
    //Atributos
    private int id;
    private Date data;
    private String nomeSwitch;
    private int portaSwitch;
    private String patchPanel;
    private int portaPatchPanel;
    private String endMac;
    private String nomePC;
    private String endIP;
    private String estado;
    private String observacao;
    
    //Métodos - Construtor
    public Componentes(int id,Date data, String nomeSwitch, int portaSwitch, String patchPainel, int portaPatchPainel,
                    String endMac,String nomePC, String endIP, String estado, String observacao) 
    {
        this.id = id;
        this.data = data;
        this.nomeSwitch = nomeSwitch;
        this.portaSwitch = portaSwitch;
        this.patchPanel = patchPanel;
        this.portaPatchPanel = portaPatchPanel;
        this.endMac = endMac;
        this.nomePC = nomePC;
        this.endIP = endIP;
        this.estado = estado;
        this.observacao = observacao;
    }
    // Métodos Getters
    public int getId() {return id;}
    public Date getData() {return data;} 
    public String getNomeSwitch() {return nomeSwitch;}
    public int getPortaSwitch() {return portaSwitch;}
    public String getPatchPanel(){return patchPanel;}
    public int getPortaPatchPanel() {return portaPatchPanel;}
    public String getEndMac(){return endMac;}
    public String getNomePC(){return nomePC;}
    public String getEndIP(){return endIP;}
    public String getEstado(){return estado;}
    public String getObservacao(){return observacao;}
    

    // Métodos Setters       
    public void setId(int id) {this.id = id;}
    public void setData(Date data) {this.data = data;}
    public void setNomeSwitch(String nomeSwitch) {this.nomeSwitch = nomeSwitch;}
    public void setPortaSwitch(int portaSwitch) {this.portaSwitch = portaSwitch;}
    public void setPatchPanel(String patchPanel) {this.patchPanel = patchPanel;}
    public void setPortaPatchPanel(int portaPatchPanel) {this.portaPatchPanel = portaPatchPanel;}
    public void setEndMac(String endMac) {this.endMac = endMac;}
    public void setNomePC(String nomePC) {this.nomePC = nomePC;}
    public void setEndIP(String endIP) {this. endIP =  endIP;}
    public void setEstado(String estado) {this.estado = estado;}
    public void setObservacao(String observacao) {this.observacao = observacao;}

    
   
}
