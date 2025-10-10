package Modelo;

public class Doctor {
    private int idDoctor;
    private String dni;
    private String nombres;
    private String apellidos;
    private String correo;
    private String especialidad;
    private String nroColegiatura;
    private String telefono;
    private String contrasenia;

    public Doctor() {
    }

    public Doctor(int idDoctor, String dni, String nombres, String apellidos,
                  String correo, String especialidad, String nroColegiatura,
                  String telefono, String contrasenia) {
        this.idDoctor = idDoctor;
        this.dni = dni;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.correo = correo;
        this.especialidad = especialidad;
        this.nroColegiatura = nroColegiatura;
        this.telefono = telefono;
        this.contrasenia = contrasenia;
    }

    public int getIdDoctor() {
        return idDoctor;
    }

    public void setIdDoctor(int idDoctor) {
        this.idDoctor = idDoctor;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public String getNroColegiatura() {
        return nroColegiatura;
    }

    public void setNroColegiatura(String nroColegiatura) {
        this.nroColegiatura = nroColegiatura;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }
}
