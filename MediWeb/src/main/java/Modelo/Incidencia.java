package Modelo;

public class Incidencia {
    private int idIncidencia;
    private String fecha;
    private String tipo;
    private String descripcion;
    private String estado;
    private String codigoAula;
    private String sede;
    private Integer idEstudiante;
    private Integer idDocente;
    
    public Incidencia() {
	}

	public Incidencia(int idIncidencia, String fecha, String tipo, String descripcion,
                      String estado, String codigoAula, String sede, Integer idEstudiante, Integer idDocente) {
        this.idIncidencia = idIncidencia;
        this.fecha = fecha;
        this.tipo = tipo;
        this.descripcion = descripcion;
        this.estado = estado;
        this.codigoAula = codigoAula;
        this.sede = sede;
        this.idEstudiante = idEstudiante;
        this.idDocente = idDocente;
    }

	public int getIdIncidencia() {
		return idIncidencia;
	}

	public void setIdIncidencia(int idIncidencia) {
		this.idIncidencia = idIncidencia;
	}

	public String getFecha() {
	    return fecha;
	}

	public void setFecha(String fecha) {
	    this.fecha = fecha;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getCodigoAula() {
		return codigoAula;
	}

	public void setCodigoAula(String codigoAula) {
		this.codigoAula = codigoAula;
	}
	
	public String getSede() {
		return sede;
	}

	public void setSede(String sede) {
		this.sede = sede;
	}

	public Integer getIdEstudiante() {
		return idEstudiante;
	}

	public void setIdEstudiante(Integer idEstudiante) {
		this.idEstudiante = idEstudiante;
	}

	public Integer getIdDocente() {
		return idDocente;
	}

	public void setIdDocente(Integer idDocente) {
		this.idDocente = idDocente;
	}
}

