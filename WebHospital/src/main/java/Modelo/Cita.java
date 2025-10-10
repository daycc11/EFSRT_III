package Modelo;

public class Cita {
    private int idCita;
    private String fechaRegistrada;
    private String horaRegistrada;
    private String fechaProgramada;
    private String horaProgramada;
    private String estado;
    private String descripcion;
    private Integer idPaciente;
    private Integer idDoctor;
    private Integer idRecepcion;

    public Cita() {
    }

    public Cita(int idCita, String fechaRegistrada, String horaRegistrada,
                String fechaProgramada, String horaProgramada, String estado,
                String descripcion, Integer idPaciente, Integer idDoctor, Integer idRecepcion) {
        this.idCita = idCita;
        this.fechaRegistrada = fechaRegistrada;
        this.horaRegistrada = horaRegistrada;
        this.fechaProgramada = fechaProgramada;
        this.horaProgramada = horaProgramada;
        this.estado = estado;
        this.descripcion = descripcion;
        this.idPaciente = idPaciente;
        this.idDoctor = idDoctor;
        this.idRecepcion = idRecepcion;
    }

    public int getIdCita() {
        return idCita;
    }

    public void setIdCita(int idCita) {
        this.idCita = idCita;
    }

    public String getFechaRegistrada() {
        return fechaRegistrada;
    }

    public void setFechaRegistrada(String fechaRegistrada) {
        this.fechaRegistrada = fechaRegistrada;
    }

    public String getHoraRegistrada() {
        return horaRegistrada;
    }

    public void setHoraRegistrada(String horaRegistrada) {
        this.horaRegistrada = horaRegistrada;
    }

    public String getFechaProgramada() {
        return fechaProgramada;
    }

    public void setFechaProgramada(String fechaProgramada) {
        this.fechaProgramada = fechaProgramada;
    }

    public String getHoraProgramada() {
        return horaProgramada;
    }

    public void setHoraProgramada(String horaProgramada) {
        this.horaProgramada = horaProgramada;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Integer getIdPaciente() {
        return idPaciente;
    }

    public void setIdPaciente(Integer idPaciente) {
        this.idPaciente = idPaciente;
    }

    public Integer getIdDoctor() {
        return idDoctor;
    }

    public void setIdDoctor(Integer idDoctor) {
        this.idDoctor = idDoctor;
    }

    public Integer getIdRecepcion() {
        return idRecepcion;
    }

    public void setIdRecepcion(Integer idRecepcion) {
        this.idRecepcion = idRecepcion;
    }
}
