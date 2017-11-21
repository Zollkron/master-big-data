package InteligenciaNegocio.ImplementacionETL.Controlador;

import org.json.JSONArray;
import org.json.JSONObject;

import InteligenciaNegocio.ImplementacionETL.Servicio.ServicioJSON;

public class Controlador {
	
	private static Controlador unicaInstancia;
	private ServicioJSON servicioJSON = ServicioJSON.getUnicaInstancia();
	
	private Controlador(){
		//Constructor privado
	}
	
	public static Controlador getUnicaInstancia(){
		if(unicaInstancia == null) {
			unicaInstancia = new Controlador();
		}
		return unicaInstancia;
	}
	
	public JSONObject leerJSON(String nombreFichero) {
		return servicioJSON.leerJSON(nombreFichero);
	}
	
	public JSONArray leerVariosJSONMismoFichero(String nombreFichero) {
		return servicioJSON.leerVariosJSONMismoFichero(nombreFichero);
	}
	
	public JSONArray leerVariosJSONDesdeCadenaJSON(String cadenaJSON) {
		return servicioJSON.leerVariosJSONDesdeCadenaJSON(cadenaJSON);
	}
	
	public boolean isJSONValido(JSONObject objetoJSON) {
		return servicioJSON.isJSONValido(objetoJSON);
	}
	
}
