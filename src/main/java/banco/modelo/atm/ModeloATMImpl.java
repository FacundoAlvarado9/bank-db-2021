package banco.modelo.atm;

import java.io.FileInputStream;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import banco.modelo.ModeloImpl;
import banco.utils.Fechas;


public class ModeloATMImpl extends ModeloImpl implements ModeloATM {
	
	private static Logger logger = LoggerFactory.getLogger(ModeloATMImpl.class);	

	private String tarjeta = null;   // mantiene la tarjeta del cliente actual
	private Integer codigoATM = null;
	
	private String caja=null, cliente=null; //mantiene el numero de caja y el numero de cliente correspondientes a la tarjeta actual
	
	/*
	 * La información del cajero ATM se recupera del archivo que se encuentra definido en ModeloATM.CONFIG
	 */
	public ModeloATMImpl() {
		logger.debug("Se crea el modelo ATM.");

		logger.debug("Recuperación de la información sobre el cajero");
		
		Properties prop = new Properties();
		try (FileInputStream file = new FileInputStream(ModeloATM.CONFIG))
		{
			logger.debug("Se intenta leer el archivo de propiedades {}",ModeloATM.CONFIG);
			prop.load(file);

			codigoATM = Integer.valueOf(prop.getProperty("atm.codigo.cajero"));

			logger.debug("Código cajero ATM: {}", codigoATM);
		}
		catch(Exception ex)
		{
        	logger.error("Se produjo un error al recuperar el archivo de propiedades {}.",ModeloATM.CONFIG); 
		}
		return;
	}

	@Override
	public boolean autenticarUsuarioAplicacion(String tarjeta, String pin) throws Exception{
		
		logger.info("Se intenta autenticar la tarjeta {} con pin {}", tarjeta, pin);

		/** 
		 * TODO Código que autentica que exista una tarjeta con ese pin (el pin guardado en la BD está en MD5)
		 *      En caso exitoso deberá registrar la tarjeta en la propiedad tarjeta y retornar true.
		 *      Si la autenticación no es exitosa porque no coincide el pin o la tarjeta no existe deberá retornar falso
		 *      y si hubo algún otro error deberá producir una excepción.
		 */
		boolean resul_autenticacion = false;

		try {

			ResultSet rs = this.consulta("SELECT nro_tarjeta,nro_cliente,nro_ca FROM tarjeta WHERE  nro_tarjeta= " + Integer.parseInt(tarjeta) + " AND pin=md5(" + pin + ")");

			
			while (rs.next()) { //Si hay resultados, entonces coincide la tarjeta y el pin.
				resul_autenticacion = true; //Resultó exitosa la autenticación
				this.tarjeta = rs.getString("nro_tarjeta"); //seteo el numero de tarjeta
				this.caja = rs.getString("nro_ca"); //seteo el numero de caja
				this.cliente = rs.getString("nro_cliente");//Seteo el numero de cliente
			}
			rs.close();
		} catch(SQLException ex) {
			logger.error("SQLException: " + ex.getMessage());
			logger.error("SQLState: " + ex.getSQLState());
			logger.error("VendorError: " + ex.getErrorCode());
			throw new Exception("Error al recuperar la tarjeta de la BD.");
		}

		return resul_autenticacion;
	
	}
	
	
	@Override
	public Double obtenerSaldo() throws Exception
	{
		logger.info("Se intenta obtener el saldo de cliente {}", 3);

		if (this.tarjeta == null ) {
			throw new Exception("El cliente no ingresó la tarjeta");
		}

		/** 
		 * TODO (hecho) Obtiene el saldo.
		 *      Debe capturar la excepción SQLException y propagar una Exception más amigable.
		 */

		double saldo=0;

		try {

			ResultSet rs = this.consulta("SELECT * FROM caja_ahorro where nro_ca="+caja);
			
			if(rs.next()) {
				saldo = rs.getDouble("saldo"); //seteo el saldo
				System.out.println("saldo: "+saldo);
			}
			
			
			rs.close();
		} catch(SQLException ex) {
			logger.error("SQLException: " + ex.getMessage());
			logger.error("SQLState: " + ex.getSQLState());
			logger.error("VendorError: " + ex.getErrorCode());
			throw new Exception("Error al recuperar el saldo de la BD.");
		}

		return saldo;
	}	

	@Override
	public ArrayList<TransaccionCajaAhorroBean> cargarUltimosMovimientos() throws Exception {
		return this.cargarUltimosMovimientos(ModeloATM.ULTIMOS_MOVIMIENTOS_CANTIDAD);
	}	
	
	@Override
	public ArrayList<TransaccionCajaAhorroBean> cargarUltimosMovimientos(int cantidad) throws Exception
	{
		logger.info("Busca las ultimas {} transacciones en la BD de la tarjeta {}",cantidad, Integer.valueOf(this.tarjeta.trim()));

		/**
		 * TODO Deberá recuperar los ultimos movimientos del cliente, la cantidad está definida en el parámetro.
		 * 		Debe capturar la excepción SQLException y propagar una Exception más amigable. 
		 */
		
		
		int cant=1;
		
		ArrayList<TransaccionCajaAhorroBean> lista = new ArrayList<TransaccionCajaAhorroBean>();
		TransaccionCajaAhorroBean filaNueva;
		try {

			ResultSet rs = this.consulta("SELECT * FROM trans_cajas_ahorro where nro_cliente="+cliente+" OR nro_ca="+caja);

			
			while (rs.next() && cant<=cantidad) { //Recorro la vista trans_caja_Ahorro obteniendo todos los valores necesarios para cada fila
				filaNueva = new TransaccionCajaAhorroBeanImpl();
				filaNueva.setTransaccionFechaHora(Fechas.convertirStringADate(rs.getString("fecha"),rs.getString("hora")));
				filaNueva.setTransaccionTipo(rs.getString("tipo"));
				filaNueva.setTransaccionMonto(rs.getDouble("monto"));
				filaNueva.setTransaccionCodigoCaja(rs.getInt("cod_caja"));
				filaNueva.setCajaAhorroDestinoNumero(rs.getInt("destino"));
				lista.add(filaNueva);
				
				cant++;
			}
			rs.close();
		} catch(SQLException ex) {
			logger.error("SQLException: " + ex.getMessage());
			logger.error("SQLState: " + ex.getSQLState());
			logger.error("VendorError: " + ex.getErrorCode());
			throw new Exception("Error al recuperar los ultimos movimientos de la BD.");
		}
		
		
		return lista;
		
		
	}	
	
	@Override
	public ArrayList<TransaccionCajaAhorroBean> cargarMovimientosPorPeriodo(Date desde, Date hasta)
			throws Exception {

		/**
		 * TODO Deberá recuperar los ultimos del cliente que se han realizado entre las fechas indicadas.
		 * 		Debe capturar la excepción SQLException y propagar una Exception más amigable. 
		 * 		Debe generar excepción sin las fechas son erroneas (ver descripción en interface)
		 */
		
		
		String fechaIni="",fechaFin="";
		
		//Valido las fechas y las convierto a un formato que entienda SQL.
		fechaIni=Fechas.convertirDateAStringDB(desde);
		fechaFin=Fechas.convertirDateAStringDB(hasta);
		
		ArrayList<TransaccionCajaAhorroBean> lista = new ArrayList<TransaccionCajaAhorroBean>();
		
		TransaccionCajaAhorroBean filaNueva;
		try {
			//Obtengp todas los movimientos del cliente entre ambas fechas
			ResultSet rs = this.consulta("SELECT * FROM trans_cajas_ahorro  WHERE (nro_cliente="+cliente+" or nro_ca="+caja+") and TIMEDIFF('"+fechaFin+"',fecha)>'00-00-00' AND TIMEDIFF('"+fechaIni+"',fecha)<0");

			
			while (rs.next()) { //Recorro las filas obtenidas de la vista trans_caja_Ahorro recuperando todos los valores necesarios para cada fila
				filaNueva = new TransaccionCajaAhorroBeanImpl();
				filaNueva.setTransaccionFechaHora(Fechas.convertirStringADate(rs.getString("fecha"),rs.getString("hora")));
				filaNueva.setTransaccionTipo(rs.getString("tipo"));
				filaNueva.setTransaccionMonto(rs.getDouble("monto"));
				filaNueva.setTransaccionCodigoCaja(rs.getInt("cod_caja"));
				filaNueva.setCajaAhorroDestinoNumero(rs.getInt("destino"));
				lista.add(filaNueva);
				
			}
			rs.close();
		} catch(SQLException ex) {
			logger.error("SQLException: " + ex.getMessage());
			logger.error("SQLState: " + ex.getSQLState());
			logger.error("VendorError: " + ex.getErrorCode());
			throw new Exception("Error al recuperar movimientos por periodo de la BD.");
		}
		
		return lista;
		
	}
	
	
	@Override
	public Double extraer(Double monto) throws Exception {
		logger.info("Realiza la extraccion de ${} sobre la cuenta", monto);
		
		/**
		 * TODO Deberá extraer de la cuenta del cliente el monto especificado (ya validado) y de obtener el saldo de la cuenta como resultado.
		 * 		Debe capturar la excepción SQLException y propagar una Exception más amigable. 
		 * 		Debe generar excepción si las propiedades codigoATM o tarjeta no tienen valores
		 */

		ResultSet rs;
		String resultado;
		System.out.println("CALL procedimiento_extraccion("+cliente+","+codigoATM+","+caja+","+monto+")");
		PreparedStatement update = conexion.prepareCall("CALL procedimiento_extraccion("+cliente+","+codigoATM+","+caja+","+monto+")");
		double saldo=-1;
		try {
			rs=update.executeQuery();
			if(rs.next()) {
				saldo=this.obtenerSaldo();
				resultado=rs.getString("resultado")+"Su saldo actual es: $"+saldo;
				if (!resultado.equals(ModeloATM.EXTRACCION_EXITOSA)) {
					throw new Exception(resultado);
				}
			}
			rs.close();
		} catch(SQLException ex) {
			logger.error("SQLException: " + ex.getMessage());
			logger.error("SQLState: " + ex.getSQLState());
			logger.error("VendorError: " + ex.getErrorCode());
			throw new Exception("Error al realizar extraccion.");
		}

		return saldo;
	}

	
	@Override
	public int parseCuenta(String p_cuenta) throws Exception {
		
		logger.info("Intenta realizar el parsing de un codigo de cuenta {}", p_cuenta);

		/**
		 * TODO (Hecho) Verifica que el codigo de la cuenta sea valido. 
		 * 		Debe capturar la excepción SQLException y propagar una Exception más amigable. 
		 * 		Debe generar excepción si la cuenta es vacia, entero negativo o no puede generar el parsing.
		 * retorna la cuenta en formato int
		 */	
		
		/*
		 * Nada mas se ve que el dato venga bien de la interface de usuario
		 * Solamente se verifica que p_Cuenta no sea nulo ni menor a acero,
		 * (El cheqeo de que la caja de ahorro exista se va a hacer despues desde el store procedure)
		 */
		Integer cuenta;
		
		if (isNumeric(p_cuenta) == true) {//Verifico que el string sea un numero
			cuenta = Integer.parseInt(p_cuenta);
            System.out.println("Numero: " + p_cuenta);
        } else {
        	throw new Exception("Error: El numero de cuenta ingresado no es un numero");
        }
		
		if(cuenta<=0) {
			throw new Exception("Error: El numero de cuenta no puede ser menor o igual a cero");
		}
		
		
		//logger.info("Encontró la cuenta en la BD.");
        return cuenta;
	}	
	
	 private boolean isNumeric(String cadena) {

	        boolean resultado;

	        try {
	            Integer.parseInt(cadena);
	            resultado = true;
	        } catch (NumberFormatException excepcion) {
	            resultado = false;
	        }

	        return resultado;
	    }

	
	@Override
	public Double transferir(Double monto, int cajaDestino) throws Exception {
		logger.info("Realiza la transferencia de ${} sobre a la cuenta {}", monto, cajaDestino);
		
		/**
		 * TODO Deberá extraer de la cuenta del cliente el monto especificado (ya validado) y de obtener el saldo de la cuenta como resultado.
		 * 		Debe capturar la excepción SQLException y propagar una Exception más amigable. 
		 * 		Debe generar excepción si las propiedades codigoATM o tarjeta no tienen valores
		 */		
		
		if (tarjeta==null ) {
			throw new Exception("Tarjeta nula");
		}
		
		if (codigoATM==null ) {
			throw new Exception("codigoATM nulo");
		}
		
		ResultSet rs;
		String resultado;
		PreparedStatement update = conexion.prepareCall("CALL procedimiento_transferencia("+cliente+","+codigoATM+","+caja+","+cajaDestino+","+monto+")");

		try {
			rs=update.executeQuery();
			if(rs.next()) {
				resultado=rs.getString("resultado");
				if (!resultado.equals(ModeloATM.TRANSFERENCIA_EXITOSA)) {
					throw new Exception(resultado);
				}
			}
			rs.close();
		} catch(SQLException ex) {
			logger.error("SQLException: " + ex.getMessage());
			logger.error("SQLState: " + ex.getSQLState());
			logger.error("VendorError: " + ex.getErrorCode());
			throw new Exception("Error al realizar la transferencia.");
		}
		
		return this.obtenerSaldo();
	}


	@Override
	public Double parseMonto(String p_monto) throws Exception {
		
		logger.info("Intenta realizar el parsing del monto {}", p_monto);
		
		if (p_monto == null) {
			throw new Exception("El monto no puede estar vacío");
		}

		try 
		{
			double monto = Double.parseDouble(p_monto);
			DecimalFormat df = new DecimalFormat("#.00");

			monto = Double.parseDouble(corregirComa(df.format(monto)));
			
			if(monto < 0)
			{
				throw new Exception("El monto no debe ser negativo.");
			}
			
			return monto;
		}		
		catch (NumberFormatException e)
		{
			throw new Exception("El monto no tiene un formato válido.");
		}	
	}

	private String corregirComa(String n)
	{
		String toReturn = "";
		
		for(int i = 0;i<n.length();i++)
		{
			if(n.charAt(i)==',')
			{
				toReturn = toReturn + ".";
			}
			else
			{
				toReturn = toReturn+n.charAt(i);
			}
		}
		
		return toReturn;
	}	
	
	

	
}
