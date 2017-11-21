package InteligenciaNegocio.ImplementacionETL.Dominio;

public class Tiempo {
	
	private int id;
	private int dia;
	private int mes;
	private int anyo;
	
	public Tiempo(int id, int dia, int mes, int anyo) {
		super();
		this.id = id;
		this.dia = dia;
		this.mes = mes;
		this.anyo = anyo;
	}

	public int getId() {
		return id;
	}

	public int getDia() {
		return dia;
	}

	public int getMes() {
		return mes;
	}

	public int getAnyo() {
		return anyo;
	}

}
