package banco.modelo.atm;

import java.io.FileInputStream;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
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
		 * TODO Obtiene el saldo.
		 *      Debe capturar la excepción SQLException y propagar una Exception más amigable.
		 */

		double saldo=0;

		try {

			ResultSet rs = this.consulta("SELECT * FROM trans_cajas_ahorro where nro_ca="+caja);

			
			
			if(rs.next()) {
				saldo = rs.getDouble("saldo"); //seteo el saldo
				System.out.println("saldo: "+saldo);
			}
			
			
			
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
		
		
		int cant=0;
		
		ArrayList<TransaccionCajaAhorroBean> lista = new ArrayList<TransaccionCajaAhorroBean>();
		TransaccionCajaAhorroBean filaNueva;
		try {

			ResultSet rs = this.consulta("SELECT * FROM trans_cajas_ahorro where nro_cliente="+cliente);

			
			while (rs.next() && cant<=cantidad) { //Recorro lavista trans_caja_Ahorro obteniendo todos los valores necesarios para cada fila
				filaNueva = new TransaccionCajaAhorroBeanImpl();
				filaNueva.setTransaccionFechaHora(Fechas.convertirStringADate(rs.getString("fecha"),rs.getString("hora")));
				filaNueva.setTransaccionTipo(rs.getString("tipo"));
				filaNueva.setTransaccionMonto(rs.getDouble("monto"));
				filaNueva.setTransaccionCodigoCaja(rs.getInt("cod_caja"));
				filaNueva.setCajaAhorroDestinoNumero(rs.getInt("destino"));
				lista.add(filaNueva);
				
			}
			
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
		
		/*
		 * Datos estáticos de prueba. Quitar y reemplazar por código que recupera los datos reales.
		 * 
		+------------+----------+---------------+---------+----------+---------+
		| fecha      | hora     | tipo          | monto   | cod_caja | destino |
		+------------+----------+---------------+---------+----------+---------+
		| 2021-09-16 | 11:10:00 | transferencia | -700.00 |       18 |      32 |
		| 2021-09-15 | 17:20:00 | extraccion    | -200.00 |        2 |    NULL |
		| 2021-09-14 | 09:03:00 | deposito      | 1600.00 |        2 |    NULL |
		| 2021-09-13 | 13:30:00 | debito        |  -50.00 |     NULL |    NULL |
		| 2021-09-12 | 15:00:00 | transferencia | -400.00 |       41 |       7 |
		+------------+----------+---------------+---------+----------+---------+
 		 */
		
		ArrayList<TransaccionCajaAhorroBean> lista = new ArrayList<TransaccionCajaAhorroBean>();
		
		
		
		TransaccionCajaAhorroBean fila1 = new TransaccionCajaAhorroBeanImpl();
		fila1.setTransaccionFechaHora(Fechas.convertirStringADate("2021-09-16","11:10:00"));
		fila1.setTransaccionTipo("transferencia");
		fila1.setTransaccionMonto(-700.00);
		fila1.setTransaccionCodigoCaja(18);
		fila1.setCajaAhorroDestinoNumero(32);
		lista.add(fila1);

		TransaccionCajaAhorroBean fila2 = new TransaccionCajaAhorroBeanImpl();
		fila2.setTransaccionFechaHora(Fechas.convertirStringADate("2021-09-15","17:20:00"));
		fila2.setTransaccionTipo("extraccion");
		fila2.setTransaccionMonto(-200.00);
		fila2.setTransaccionCodigoCaja(2);
		fila2.setCajaAhorroDestinoNumero(0);	
		lista.add(fila2);
		
		TransaccionCajaAhorroBean fila3 = new TransaccionCajaAhorroBeanImpl();
		fila3.setTransaccionFechaHora(Fechas.convertirStringADate("2021-09-14","09:03:00"));
		fila3.setTransaccionTipo("deposito");
		fila3.setTransaccionMonto(1600.00);
		fila3.setTransaccionCodigoCaja(2);
		fila3.setCajaAhorroDestinoNumero(0);	
		lista.add(fila3);		

		TransaccionCajaAhorroBean fila4 = new TransaccionCajaAhorroBeanImpl();
		fila4.setTransaccionFechaHora(Fechas.convertirStringADate("2021-09-13","13:30:00"));
		fila4.setTransaccionTipo("debito");
		fila4.setTransaccionMonto(-50.00);
		fila4.setTransaccionCodigoCaja(0);
		fila4.setCajaAhorroDestinoNumero(0);	
		lista.add(fila4);	
		
		TransaccionCajaAhorroBean fila5 = new TransaccionCajaAhorroBeanImpl();
		fila5.setTransaccionFechaHora(Fechas.convertirStringADate("2021-09-12","15:00:00"));
		fila5.setTransaccionTipo("transferencia");
		fila5.setTransaccionMonto(-400.00);
		fila5.setTransaccionCodigoCaja(41);
		fila5.setCajaAhorroDestinoNumero(7);	
		lista.add(fila5);
		
		logger.debug("Retorna una lista con {} elementos", lista.size());
		
		return lista;
		
		// Fin datos estáticos de prueba.
	}
	
	@Override
	public Double extraer(Double monto) throws Exception {
		logger.info("Realiza la extraccion de ${} sobre la cuenta", monto);
		
		/**
		 * TODO Deberá extraer de la cuenta del cliente el monto especificado (ya validado) y de obtener el saldo de la cuenta como resultado.
		 * 		Debe capturar la excepción SQLException y propagar una Exception más amigable. 
		 * 		Debe generar excepción si las propiedades codigoATM o tarjeta no tienen valores
		 */		
		
		String resultado = ModeloATM.EXTRACCION_EXITOSA;
		
		if (!resultado.equals(ModeloATM.EXTRACCION_EXITOSA)) {
			throw new Exception(resultado);
		}
		return this.obtenerSaldo();

	}

	
	@Override
	public int parseCuenta(String p_cuenta) throws Exception {
		
		logger.info("Intenta realizar el parsing de un codigo de cuenta {}", p_cuenta);

		/**
		 * TODO Verifica que el codigo de la cuenta sea valido. 
		 * 		Debe capturar la excepción SQLException y propagar una Exception más amigable. 
		 * 		Debe generar excepción si la cuenta es vacia, entero negativo o no puede generar el parsing.
		 * retorna la cuenta en formato int
		 */	
		
		logger.info("Encontró la cuenta en la BD.");
        return 1;
	}	
	
	@Override
	public Double transferir(Double monto, int cajaDestino) throws Exception {
		logger.info("Realiza la transferencia de ${} sobre a la cuenta {}", monto, cajaDestino);
		
		/**
		 * TODO Deberá extraer de la cuenta del cliente el monto especificado (ya validado) y de obtener el saldo de la cuenta como resultado.
		 * 		Debe capturar la excepción SQLException y propagar una Exception más amigable. 
		 * 		Debe generar excepción si las propiedades codigoATM o tarjeta no tienen valores
		 */		
		

		String resultado = ModeloATM.TRANSFERENCIA_EXITOSA;
		
		if (!resultado.equals(ModeloATM.TRANSFERENCIA_EXITOSA)) {
			throw new Exception(resultado);
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
