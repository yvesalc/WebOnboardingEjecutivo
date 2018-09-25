package cl.com.ccla.onboarding.VO;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class OfertaVO {
	private String fechacreacion;
	private String usuariocreacion;
	private String fechamodificacion;
	private String usuariomodifica;
	private String ofertacredito;
	private int idestadoOferta;
	private String NombreEstadoOferta;
	
	
	public String getNombreEstadoOferta() {
		return NombreEstadoOferta;
	}

	public void setNombreEstadoOferta(String nombreEstadoOferta) {
		NombreEstadoOferta = nombreEstadoOferta;
	}

	private String ofertacodigo;

	public String getIdOferta() {
		return idOferta;
	}

	public void setIdOferta(String idOferta) {
		this.idOferta = idOferta;
	}

	private String idOferta;
	private String idusaurio;
	private String rut;
	private String derivado;
	private String sucursal;
	private String docFirmado;

	public String getFechacreacion() {
		return fechacreacion;
	}

	public void setFechacreacion(String fechacreacion) {
		this.fechacreacion = fechacreacion;
	}

	public String getUsuariocreacion() {
		return usuariocreacion;
	}

	public void setUsuariocreacion(String usuariocreacion) {
		this.usuariocreacion = usuariocreacion;
	}

	public String getFechamodificacion() {
		return fechamodificacion;
	}

	public void setFechamodificacion(String fechamodificacion) {
		this.fechamodificacion = fechamodificacion;
	}

	public String getUsuariomodifica() {
		return usuariomodifica;
	}

	public void setUsuariomodifica(String usuariomodifica) {
		this.usuariomodifica = usuariomodifica;
	}

	public String getOfertacredito() {
		return ofertacredito;
	}

	public void setOfertacredito(String ofertacredito) {
		this.ofertacredito = ofertacredito;
	}

	


	public int getIdestadoOferta() {
		return idestadoOferta;
	}

	public void setIdestadoOferta(int idestadoOferta) {
		this.idestadoOferta = idestadoOferta;
	}

	public String getOfertacodigo() {
		return ofertacodigo;
	}

	public void setOfertacodigo(String ofertacodigo) {
		this.ofertacodigo = ofertacodigo;
	}

	public String getIdusaurio() {
		return idusaurio;
	}

	public void setIdusaurio(String idusaurio) {
		this.idusaurio = idusaurio;
	}

	public String getRut() {
		return rut;
	}

	public void setRut(String rut) {
		this.rut = rut;
	}

	public String getDerivado() {
		return derivado;
	}

	public void setDerivado(String derivado) {
		this.derivado = derivado;
	}

	public String getSucursal() {
		return sucursal;
	}

	public void setSucursal(String sucursal) {
		this.sucursal = sucursal;
	}

	public String getDocFirmado() {
		return docFirmado;
	}

	public void setDocFirmado(String docFirmado) {
		this.docFirmado = docFirmado;
	}

}
