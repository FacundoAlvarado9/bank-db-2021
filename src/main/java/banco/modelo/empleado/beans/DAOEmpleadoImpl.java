package banco.modelo.empleado.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DAOEmpleadoImpl implements DAOEmpleado {

	private static Logger logger = LoggerFactory.getLogger(DAOEmpleadoImpl.class);
	
	private Connection conexion;
	
	public DAOEmpleadoImpl(Connection c) {
		this.conexion = c;
	}


	@Override
	public EmpleadoBean recuperarEmpleado(int legajo) throws Exception {
		logger.info("recupera el empleado que corresponde al legajo {}.", legajo);
		
		/**
		 * TODO (hecho) Debe recuperar los datos del empleado que corresponda al legajo pasado como parámetro.
		 *      Si no existe deberá retornar null y 
		 *      De ocurrir algun error deberá generar una excepción.		 
		 */		
		
		String sql = "SELECT * FROM empleado WHERE legajo=" + legajo;

		logger.info("sql: {}", sql);

		EmpleadoBean empleado = null;

		try{

			Statement select = conexion.createStatement();
			ResultSet rs = select.executeQuery(sql);

			if(rs.next()){
				logger.info("Se recuperó un prestamo que coincide.");

				empleado = new EmpleadoBeanImpl();
				empleado.setLegajo(rs.getInt("legajo"));
				empleado.setApellido(rs.getString("apellido"));
				empleado.setNombre(rs.getString("nombre"));
				empleado.setTipoDocumento(rs.getString("tipo_doc"));
				empleado.setNroDocumento(rs.getInt("nro_doc"));
				empleado.setDireccion(rs.getString("direccion"));
				empleado.setTelefono(rs.getString("telefono"));
				empleado.setCargo(rs.getString("cargo"));
				empleado.setPassword(rs.getString("password"));
				empleado.setNroSucursal(rs.getInt("nro_suc"));

			}

			rs.close();
		} catch (SQLException ex){
			logger.error("SQLException: " + ex.getMessage());
			logger.error("SQLState: " + ex.getSQLState());
			logger.error("VendorError: " + ex.getErrorCode());
			throw new Exception("Error al obtener el empleado en la B.D.");
		}

		
		return empleado;
		
	}

}
