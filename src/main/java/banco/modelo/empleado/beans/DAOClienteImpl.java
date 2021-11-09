package banco.modelo.empleado.beans;

import java.sql.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import banco.utils.Fechas;

public class DAOClienteImpl implements DAOCliente {

	private static Logger logger = LoggerFactory.getLogger(DAOClienteImpl.class);
	
	private Connection conexion;
	
	public DAOClienteImpl(Connection c) {
		this.conexion = c;
	}
	
	@Override
	public ClienteBean recuperarCliente(String tipoDoc, int nroDoc) throws Exception {

		logger.info("recupera el cliente con documento de tipo {} y nro {}.", tipoDoc, nroDoc);
		
		/**
		 * TODO Recuperar el cliente que tenga un documento que se corresponda con los parámetros recibidos.  
		 *		Deberá generar o propagar una excepción si no existe dicho cliente o hay un error de conexión.		
		 */

		String sql = "SELECT * FROM cliente WHERE tipo_doc LIKE '" + tipoDoc + "' AND nro_doc = " + nroDoc;

		logger.info("sql: {}", sql);

		ClienteBean cliente = new ClienteBeanImpl();

		try{

			Statement select = conexion.createStatement();
			ResultSet rs = select.executeQuery(sql);

			while(rs.next()){

				logger.info("Se recuperó cliente que coincide.");

				cliente.setNroCliente(rs.getInt("nro_cliente"));
				cliente.setApellido(rs.getString("apellido"));
				cliente.setNombre(rs.getString("nombre"));
				cliente.setTipoDocumento(rs.getString("tipo_doc"));
				cliente.setNroDocumento(rs.getInt("nro_doc"));
				cliente.setDireccion(rs.getString("direccion"));
				cliente.setTelefono(rs.getString("telefono"));
				cliente.setFechaNacimiento(rs.getDate("fecha_nac"));
			}
			rs.close();
		} catch (SQLException ex){
			logger.error("SQLException: " + ex.getMessage());
			logger.error("SQLState: " + ex.getSQLState());
			logger.error("VendorError: " + ex.getErrorCode());
			throw new Exception("Error inesperado al recuperar cliente de la B.D.");
		}

		return cliente;		

	}

	@Override
	public ClienteBean recuperarCliente(Integer nroCliente) throws Exception {
		logger.info("recupera el cliente por nro de cliente.");
		
		/**
		 * TODO (hecho) Recuperar el cliente que tenga un número de cliente de acuerdo al parámetro recibido.  
		 *		Deberá generar o propagar una excepción si no existe dicho cliente o hay un error de conexión.		
		 */

		String sql = "SELECT * FROM cliente WHERE nro_cliente = " + nroCliente;

		logger.info("sql: {}", sql);

		ClienteBean cliente = new ClienteBeanImpl();

		try{

			Statement select = conexion.createStatement();
			ResultSet rs = select.executeQuery(sql);

			if(rs.next()){

				logger.info("Se recuperó cliente que coincide.");

				
				cliente.setNroCliente(rs.getInt("nro_cliente"));
				cliente.setApellido(rs.getString("apellido"));
				cliente.setNombre(rs.getString("nombre"));
				cliente.setTipoDocumento(rs.getString("tipo_doc"));
				cliente.setNroDocumento(rs.getInt("nro_doc"));
				cliente.setDireccion(rs.getString("direccion"));
				cliente.setTelefono(rs.getString("telefono"));
				cliente.setFechaNacimiento(rs.getDate("fecha_nac"));
			
			}else {
				throw new Exception("Error: El cliente solicitado no se encuentra en la B.D.");
			}

			rs.close();
		} catch (SQLException ex){
			logger.error("SQLException: " + ex.getMessage());
			logger.error("SQLState: " + ex.getSQLState());
			logger.error("VendorError: " + ex.getErrorCode());
			throw new Exception("Error inesperado al recuperar cliente de la B.D.");
		}

		return cliente;

	}

}
