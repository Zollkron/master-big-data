package InteligenciaNegocio.ImplementacionETL.Dominio;

public class Produccion {
	
	private Minero minero;
	private Moneda moneda;
	private Pool pool;
	private Tiempo tiempo;
	
	
	public Produccion(Minero minero, Moneda moneda, Pool pool, Tiempo tiempo) {
		super();
		this.minero = minero;
		this.moneda = moneda;
		this.pool = pool;
		this.tiempo = tiempo;
	}


	public Minero getMinero() {
		return minero;
	}


	public Moneda getMoneda() {
		return moneda;
	}


	public Pool getPool() {
		return pool;
	}


	public Tiempo getTiempo() {
		return tiempo;
	}
	
}
