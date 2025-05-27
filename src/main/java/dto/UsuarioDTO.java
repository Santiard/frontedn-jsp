package dto;

public class UsuarioDTO {
    private Long id;
    private String nombre;
    private String documento;
    private String correo;
    private String rol;


    public Long getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDocumento() {
        return documento;
    }

    public String getCorreo() {
        return correo;
    }

    public String getRol() {
        return rol;
    }
    
    public void setId(Long id) {
        this.id = id;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }
}