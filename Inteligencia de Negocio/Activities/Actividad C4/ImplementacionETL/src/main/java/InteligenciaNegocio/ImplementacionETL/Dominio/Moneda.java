package InteligenciaNegocio.ImplementacionETL.Dominio;

public class Moneda {
	
	private int id;
	private String nombre;
	private String abreviatura;
	private double cotizacion;
	private double dificultad;
	
	public Moneda(int id, String nombre, String abreviatura, double cotizacion, double dificultad) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.abreviatura = abreviatura;
		this.cotizacion = cotizacion;
		this.dificultad = dificultad;
	}

	public int getId() {
		return id;
	}

	public String getNombre() {
		return nombre;
	}

	public String getAbreviatura() {
		return abreviatura;
	}

	public double getCotizacion() {
		return cotizacion;
	}

	public double getDificultad() {
		return dificultad;
	}

}
