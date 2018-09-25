package cl.com.ccla.onboarding.VO;

public class PerfilVO {
    public PerfilVO(int idPerfil, String estadoPerfil, String nombrePerfil) {

        this.idPerfil = idPerfil;
        this.estadoPerfil = estadoPerfil;
        this.nombrePerfil = nombrePerfil;
    }

    private int idPerfil;
    private String estadoPerfil;
    private String nombrePerfil;

    public void setIdPerfil(int idPerfil) {
        this.idPerfil = idPerfil;
    }

    public int getIdPerfil() {
        return idPerfil;
    }

    public void setEstadoPerfil(String estadoPerfil) {
        this.estadoPerfil = estadoPerfil;
    }

    public String getEstadoPerfil() {
        return estadoPerfil;
    }

    public void setNombrePerfil(String nombrePerfil) {
        this.nombrePerfil = nombrePerfil;
    }

    public String getNombrePerfil() {
        return nombrePerfil;
    }


}
