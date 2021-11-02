package banco.modelo.empleado.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import banco.modelo.atm.TransaccionCajaAhorroBean;
import banco.modelo.atm.TransaccionCajaAhorroBeanImpl;
import banco.utils.Fechas;

public class DAOClienteMorosoImpl implements DAOClienteMoroso {

	private static Logger logger = LoggerFactory.getLogger(DAOClienteMorosoImpl.class);
	
	private Connection conexion;
	
	public DAOClienteMorosoImpl(Connection c) {
		this.conexion = c;
	}
	
	@Override
	public ArrayList<ClienteMorosoBean> recuperarClientesMorosos() throws Exception {
		
		logger.info("Busca los clientes morosos.");
		
		DAOPrestamo daoPrestamo = new DAOPrestamoImpl(this.conexion);		
		DAOCliente daoCliente = new DAOClienteImpl(this.conexion);
		
		/**
		 * TODO Deberá recuperar un listado de clientes morosos los cuales consisten de un bean ClienteMorosoBeanImpl
		 *      deberá indicar para dicho cliente cual es el prestamo sobre el que está moroso y la cantidad de cuotas que 
		 *      tiene atrasadas. En todos los casos deberá generar excepciones que será capturadas por el controlador
		 *      si hay algún error que necesita ser informado al usuario. 
		 */
		
		String sql_nros_prestamos="SELECT nro_prestamo, COUNT(nro_prestamo) AS cuotas_atrasadas FROM prestamo NATURAL JOIN pago WHERE TIMEDIFF(CURDATE(),fecha_venc)>0 AND fecha_pago IS NULL GROUP BY nro_prestamo";
		
		ArrayList<ClienteMorosoBean> morosos = new ArrayList<ClienteMorosoBean>();
		ClienteMorosoBean moroso;
		PrestamoBean prestamo = null;
		ClienteBean cliente = null;
		
		try {
			Statement select = conexion.createStatement();
			ResultSet rsNrosPrestamosMorosos = select.executeQuery(sql_nros_prestamos);//Obtengo todos los numeros de prestamos que tienen cuotas atrasadas y cuantas cuaotas tienen atrasadas
			
			while (rsNrosPrestamosMorosos.next()) { //Recorro los numeros de prestamos morosos y por cada uno obtengo el prestamo y el cliente
				prestamo = daoPrestamo.recuperarPrestamo(rsNrosPrestamosMorosos.getInt("nro_prestamo"));
				cliente = daoCliente.recuperarCliente(prestamo.getNroCliente());
				
				//Armo el cliente moroso y lo agrego a la lista
				moroso = new ClienteMorosoBeanImpl();
				moroso.setCliente(cliente);
				moroso.setPrestamo(prestamo);	
				moroso.setCantidadCuotasAtrasadas(rsNrosPrestamosMorosos.getInt("cuotas_atrasadas"));
				morosos.add(moroso);
			}
			
		} catch(SQLException ex) {
			logger.error("SQLException: " + ex.getMessage());
			logger.error("SQLState: " + ex.getSQLState());
			logger.error("VendorError: " + ex.getErrorCode());
			throw new Exception("Error al recuperar prestamo moroso de la BD.");
		}
		
		
		return morosos;		

		
	}

}

