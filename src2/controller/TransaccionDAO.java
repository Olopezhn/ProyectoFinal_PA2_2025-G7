/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
    package controller;

    import java.sql.*;
    import java.util.ArrayList;
    import java.util.List;
    import model.Transaccion;
    import bd.ConnectionDB;

    public class TransaccionDAO {

        private Connection con;

     public TransaccionDAO() {
        try {
            con = ConnectionDB.getConnection();
        } catch (SQLException e) {
            System.out.println("Error al conectar a la base de datos: " + e.getMessage());
        }
    }

        // Obtener todas las transacciones
        public List<Transaccion> getAll() {
            List<Transaccion> lista = new ArrayList<>();
            String sql = "SELECT * FROM transacciones";

            try (PreparedStatement ps = con.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    Transaccion t = new Transaccion();
                    t.setNumeroRecibo(rs.getInt("numero_recibo"));
                    t.setIdUsuario(rs.getInt("id_usuario"));
                    t.setMonto(rs.getDouble("monto"));
                    t.setDescripcion(rs.getString("descripcion"));
                    lista.add(t);
                }

            } catch (SQLException e) {
                System.out.println("Error al obtener transacciones: " + e.getMessage());
            }

            return lista;
        }

        // Buscar por ID (numero_recibo)
        public Transaccion getById(int numeroRecibo) {
            Transaccion t = null;
            String sql = "SELECT * FROM transacciones WHERE numero_recibo = ?";

            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, numeroRecibo);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    t = new Transaccion();
                    t.setNumeroRecibo(rs.getInt("numero_recibo"));
                    t.setIdUsuario(rs.getInt("id_usuario"));
                    t.setMonto(rs.getDouble("monto"));
                    t.setDescripcion(rs.getString("descripcion"));
                }

            } catch (SQLException e) {
                System.out.println("Error al buscar transacción: " + e.getMessage());
            }

            return t;
        }

        // Insertar nueva transacción
        public void insertar(Transaccion t) {
            String sql = "INSERT INTO transacciones (id_usuario, monto, descripcion) VALUES (?, ?, ?)";

            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, t.getIdUsuario());
                ps.setDouble(2, t.getMonto());
                ps.setString(3, t.getDescripcion());
                ps.executeUpdate();
            } catch (SQLException e) {
                System.out.println("Error al insertar transacción: " + e.getMessage());
            }
        }

        // Actualizar transacción
        public void actualizar(Transaccion t) {
            String sql = "UPDATE transacciones SET id_usuario=?, monto=?, descripcion=? WHERE numero_recibo=?";

            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, t.getIdUsuario());
                ps.setDouble(2, t.getMonto());
                ps.setString(3, t.getDescripcion());
                ps.setInt(4, t.getNumeroRecibo());
                ps.executeUpdate();
            } catch (SQLException e) {
                System.out.println("Error al actualizar transacción: " + e.getMessage());
            }
        }

        // Eliminar transacción
        public void eliminar(int numeroRecibo) {
            String sql = "DELETE FROM transacciones WHERE numero_recibo = ?";

            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, numeroRecibo);
                ps.executeUpdate();
            } catch (SQLException e) {
                System.out.println("Error al eliminar transacción: " + e.getMessage());
            }
        }
    }