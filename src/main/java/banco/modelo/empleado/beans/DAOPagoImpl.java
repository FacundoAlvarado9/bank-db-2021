package banco.modelo.empleado.beans;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import banco.utils.Fechas;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class DAOPagoImpl implements DAOPago {

	private static Logger logger = LoggerFactory.getLogger(DAOPagoImpl.class);

	private Connection conexion;

	public DAOPagoImpl(Connection c) {
		this.conexion = c;
	}

	@Override
	public ArrayList<PagoBean> recuperarPagos(int nroPrestamo) throws Exception {
		logger.info("Inicia la recuperacion de los pagos del prestamo {}", nroPrestamo);

		/**
		 * TODO Recupera todos los pagos del prestamo (pagos e impagos) del prestamo nroPrestamo
		 * 	    Si ocurre algún error deberá propagar una excepción.
		 */

		String query_sql = "SELECT * FROM pago WHERE nro_prestamo = " + nroPrestamo;

		logger.debug("sql: {}", query_sql);

		ArrayList<PagoBean> lista = new ArrayList<PagoBean>();

		try {

			Statement select = conexion.createStatement();
			ResultSet rs = select.executeQuery(query_sql);

			while (rs.next()) {
				logger.debug("Se recuperó pago nro {} para prestamo nro {}", rs.getInt("nro_pago"), rs.getInt("nro_prestamo"));
				PagoBean p = new PagoBeanImpl();
				p.setNroPago(rs.getInt("nro_pago"));
				p.setNroPrestamo(rs.getInt("nro_prestamo"));
				p.setFechaVencimiento(rs.getDate("fecha_venc"));
				p.setFechaPago(rs.getDate("fecha_pago"));
				lista.add(p);
			}

		} catch (SQLException ex) {
			logger.error("SQLException: " + ex.getMessage());
			logger.error("SQLState: " + ex.getSQLState());
			logger.error("VendorError: " + ex.getErrorCode());
			throw new Exception("Error: al recuperar pagos de la B.D.");
		}

		return lista;
	}

	@Override
	public void registrarPagos(int nroCliente, int nroPrestamo, List<Integer> cuotasAPagar) throws Exception {

		logger.info("Inicia el pago de las {} cuotas del prestamo {}", cuotasAPagar.size(), nroPrestamo);

		/**
		 * TODO Registra los pagos de cuotas definidos en cuotasAPagar.
		 *
		 * nroCliente asume que esta validado
		 * nroPrestamo asume que está validado
		 * cuotasAPagar Debe verificar que las cuotas a pagar no estén pagas (fecha_pago = NULL)
		 * @throws Exception Si hubo error en la conexión
		 */

		try {

			String query_select_sql = "SELECT * FROM pago WHERE nro_prestamo = " + nroPrestamo + " AND nro_pago = ?";
			String query_update_sql = "UPDATE pago SET fecha_pago= ? WHERE nro_prestamo = " + nroPrestamo + " AND nro_pago= ?";
			PreparedStatement select = conexion.prepareStatement(query_select_sql);
			PreparedStatement update = conexion.prepareStatement(query_update_sql);
			ResultSet rs;

			for (int nroPago : cuotasAPagar) {

				logger.debug("sql: SELECT * FROM pago WHERE nro_prestamo = {} AND nro_pago = {}", nroPrestamo, nroPago);

				query_select_sql = "SELECT * FROM pago WHERE nro_prestamo = " + nroPrestamo + " AND nro_pago = "+nroPago;
				rs = select.executeQuery(query_select_sql);

				while (rs.next()) {
					logger.debug("Se recuperó pago nro {} para prestamo nro {}", rs.getInt("nro_pago"), rs.getInt("nro_prestamo"));
					Date fecha_pago = rs.getDate("fecha_pago");

					if (rs.wasNull()) { //Verifico si el ultimo valor recuperado (fecha pago) era nulo
						//entonces la cuota no está paga. Actualizo la fecha pago a ahora

						//No sé si está bien obtener la fecha de hoy así
						update.setDate(1, Fechas.convertirDateADateSQL(java.util.Calendar.getInstance().getTime()));
						update.setInt(2, rs.getInt("nro_pago"));
						update.executeUpdate();

					}

				}
			}
		} catch(SQLException ex){
			logger.error("SQLException: " + ex.getMessage());
			logger.error("SQLState: " + ex.getSQLState());
			logger.error("VendorError: " + ex.getErrorCode());
			throw new Exception("Error inesperado al consultar pagos en la B.D.");
		}
	}
}
