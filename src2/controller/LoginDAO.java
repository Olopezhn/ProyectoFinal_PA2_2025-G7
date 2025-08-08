package controller;

import bd.ConnectionDB;
import model.Login;
import java.sql.*;
import org.mindrot.jbcrypt.BCrypt;

public class LoginDAO {
    public Login Login(String dni, String contraseniaIngresada) {
        String sql = "SELECT * FROM usuarios WHERE dni_usuario = ? ";
        try (Connection con = ConnectionDB.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, dni);
           // ps.setString(2, tipo);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String hashAlmacenado = rs.getString("contrasenia");
                
              if (BCrypt.checkpw(contraseniaIngresada, hashAlmacenado)){  
                Login u = new Login();
                u.setId_usuario(rs.getInt("id_usuario"));
                u.setDni_usuario(rs.getString("dni_usuario"));
                u.setNombre_usuario(rs.getString("nombre_usuario"));
                u.setTipo_usuario(rs.getInt("tipo_usuario"));
                u.setCorreo(rs.getString("correo"));
                u.setTelefono(rs.getString("telefono"));
                //u.setContrasenia(rs.getString("contrasenia"));
                u.setContrasenia(hashAlmacenado);
                
                return u;
            }
          }
        } catch (SQLException ex) {
            System.out.println("Error al validar login: " + ex.getMessage());
        }
        return null;
    }
}
