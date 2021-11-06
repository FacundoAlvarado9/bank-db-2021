package banco.modelo.empleado.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import banco.utils.Fechas;

import javax.xml.transform.Result;

public class DAOPrestamoImpl implements DAOPrestamo {

	private static Logger logger = LoggerFactory.getLogger(DAOPrestamoImpl.class);
	
	private Connection conexion;
	
	public DAOPrestamoImpl(Connection c) {
		this.conexion = c;
	}
	
	
	@Override
	public void crearActualizarPrestamo(PrestamoBean prestamo) throws Exception {

		logger.info("Creación o actualizacion del prestamo.");
		logger.debug("fecha : {}", prestamo.getFecha());
		logger.debug("meses : {}", prestamo.getCantidadMeses());
		logger.debug("monto : {}", prestamo.getMonto());
		logger.debug("tasa : {}", prestamo.getTasaInteres());
		logger.debug("interes : {}", prestamo.getInteres());
		logger.debug("cuota : {}", prestamo.getValorCuota());
		logger.debug("legajo : {}", prestamo.getLegajo());
		logger.debug("cliente : {}", prestamo.getNroCliente());
		
		/**
		 * TODO (hecho) Crear o actualizar el Prestamo segun el PrestamoBean prestamo.
		 *      Si prestamo tiene nroPrestamo es una actualizacion, si el nroPrestamo es null entonces es un nuevo prestamo.
		 * 
		 * @throws Exception deberá propagar la excepción si ocurre alguna. Puede capturarla para loguear los errores, ej.
		 *				logger.error("SQLException: " + ex.getMessage());
		 * 				logger.error("SQLState: " + ex.getSQLState());
		 *				logger.error("VendorError: " + ex.getErrorCode());
		 *		   pero luego deberá propagarla para que se encargue el controlador. 
		 */
		

		String sql;

		try{

			if(prestamo.getNroPrestamo() == null){
				//creo un nuevo prestamo

				//INSERT INTO prestamo VALUES(NULL, fecha, cant_meses, monto, tasa_interes, interes, valor_cuota, legajo, nro_cliente)
				sql = "INSERT INTO prestamo VALUES(NULL, ?, ?, ?, ?, ?, ?, ?, ?)";

				PreparedStatement insert = conexion.prepareStatement(sql);

				insert.setDate(1, Fechas.convertirDateADateSQL(java.util.Calendar.getInstance().getTime())); //Si creamos un prestamo, la fecha es la de hoy
				insert.setInt(2, prestamo.getCantidadMeses());
				insert.setDouble(3, prestamo.getMonto());
				insert.setDouble(4, prestamo.getTasaInteres());
				insert.setDouble(5, prestamo.getInteres());
				insert.setDouble(6, prestamo.getValorCuota());
				insert.setInt(7, prestamo.getLegajo());
				insert.setInt(8, prestamo.getNroCliente());

				insert.executeUpdate();
			} else{
				//Actualizo el prestamo con nro_prestamo dado

				sql = "UPDATE prestamo " +
						"SET fecha = ?, " +
						"cant_meses = ?, " +
						"monto = ?, " +
						"tasa_interes = ?," +
						"interes = ?, " +
						"valor_cuota = ?, " +
						"legajo = ?, " +
						"nro_cliente = ? " +
						"WHERE nro_prestamo = ?";

				PreparedStatement update = conexion.prepareStatement(sql);

				update.setDate(1, Fechas.convertirDateADateSQL(prestamo.getFecha()));
				update.setInt(2, prestamo.getCantidadMeses());
				update.setDouble(3, prestamo.getMonto());
				update.setDouble(4, prestamo.getTasaInteres());
				update.setDouble(5, prestamo.getInteres());
				update.setDouble(6, prestamo.getValorCuota());
				update.setInt(7, prestamo.getLegajo());
				update.setInt(8, prestamo.getNroCliente());

				//UPDATE (...) WHERE nro_prestamo = ?
				update.setInt(9, prestamo.getNroPrestamo());

				update.executeUpdate();

			}


		} catch(SQLException ex){
			logger.error("SQLException: " + ex.getMessage());
			logger.error("SQLState: " + ex.getSQLState());
			logger.error("VendorError: " + ex.getErrorCode());
			throw new Exception("Error inesperado al crear/actualizar prestamo");
		}

	}

	@Override
	public PrestamoBean recuperarPrestamo(int nroPrestamo) throws Exception {
		
		logger.info("Recupera el prestamo nro {}.", nroPrestamo);
		
		/**
		 * TODO (hecho) Obtiene el prestamo según el id nroPrestamo
		 * 
		 * @param nroPrestamo
		 * @return Un prestamo que corresponde a ese id o null
		 * @throws Exception si hubo algun problema de conexión
		 */

		String sql = "SELECT * FROM prestamo WHERE nro_prestamo = " + nroPrestamo;

		logger.info("sql: {}", sql);

		PrestamoBean prestamo = null;

		try{

			Statement select = conexion.createStatement();
			ResultSet rs = select.executeQuery(sql);
			
			
			
			if(rs.next()){
				logger.info("Se recuperó un prestamo que coincide.");
				
				prestamo = new PrestamoBeanImpl();
				prestamo.setNroPrestamo(rs.getInt("nro_prestamo"));
				prestamo.setFecha(rs.getDate("fecha"));
				prestamo.setCantidadMeses(rs.getInt("cant_meses"));
				prestamo.setMonto(rs.getFloat("monto"));
				prestamo.setTasaInteres(rs.getFloat("tasa_interes"));
				prestamo.setInteres(rs.getFloat("interes"));
				prestamo.setValorCuota(rs.getFloat("valor_cuota"));
				prestamo.setLegajo(rs.getInt("legajo"));
				prestamo.setNroCliente(rs.getInt("nro_cliente"));
				
			}


		} catch (SQLException ex){
			logger.error("SQLException: " + ex.getMessage());
			logger.error("SQLState: " + ex.getSQLState());
			logger.error("VendorError: " + ex.getErrorCode());
			throw new Exception("Error inesperado al recuperar prestamo de la B.D.");
		}


		return prestamo;

	}

}
