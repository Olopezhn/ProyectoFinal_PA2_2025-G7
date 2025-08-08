
package view;

import controller.AutoresDAO;
import model.Autores;

import javax.swing.*;
import java.awt.event.*;
import java.util.List;




/**
 *
 * @author Novitus
 */
public class SeleccionarAutorDialog extends JDialog {
    private JTable tablaAutores;
    private JButton btnSeleccionar;
    private String autorSeleccionado;

    /**
     *
     */
    public SeleccionarAutorDialog(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();
        cargarAutores();
    }
    
   private void initComponents() {
        setTitle("Seleccionar Autor");
        setSize(400, 300);
        setLayout(new java.awt.BorderLayout());

        tablaAutores = new JTable(); // Puedes usar un DefaultTableModel
        add(new JScrollPane(tablaAutores), java.awt.BorderLayout.CENTER);

        btnSeleccionar = new JButton("Seleccionar");
        add(btnSeleccionar, java.awt.BorderLayout.SOUTH);

        btnSeleccionar.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent evt) {
                int fila = tablaAutores.getSelectedRow();
                if (fila != -1) {
                    autorSeleccionado = tablaAutores.getValueAt(fila, 0).toString(); // Suponiendo que columna 1 es el nombre
                    dispose();
                } else {
                    JOptionPane.showMessageDialog(null, "Seleccione un autor.");
                }
            }
        });
    }

    private void cargarAutores() {
        AutoresDAO dao = new AutoresDAO();
        List<Autores> lista = dao.getAll();
    
            String[] columnas = {"ID", "Nombre"};
            Object[][] data = new Object[lista.size()][2];

            for (int i = 0; i < lista.size(); i++) {
                Autores a = lista.get(i);
                data[i][0] = a.getId_autor();
                data[i][1] = a.getNombre_autor();
            }

            tablaAutores.setModel(new javax.swing.table.DefaultTableModel(data, columnas));
            }

            public String getAutorSeleccionado() {
                return autorSeleccionado;
    } 
}
