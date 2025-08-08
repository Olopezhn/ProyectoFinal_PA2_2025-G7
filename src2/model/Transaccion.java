                            /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Sac
 */
public class Transaccion {
   private int numeroRecibo;
    private int idUsuario;
    private double monto;
    private String descripcion;

    public Transaccion() {}

    public Transaccion(int numeroRecibo, int idUsuario, double monto, String descripcion) {
        this.numeroRecibo = numeroRecibo;
        this.idUsuario = idUsuario;
        this.monto = monto;
        this.descripcion = descripcion;
    }

    public int getNumeroRecibo() {
        return numeroRecibo;
    }

    public void setNumeroRecibo(int numeroRecibo) {
        this.numeroRecibo = numeroRecibo;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}
