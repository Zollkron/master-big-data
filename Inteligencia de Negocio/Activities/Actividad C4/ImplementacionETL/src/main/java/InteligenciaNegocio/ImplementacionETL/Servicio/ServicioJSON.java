package InteligenciaNegocio.ImplementacionETL.Servicio;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.nio.CharBuffer;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class ServicioJSON {
	
	private static ServicioJSON unicaInstancia;
	
	private ServicioJSON(){
		//Constructor privado
	}
	
	public static ServicioJSON getUnicaInstancia(){
		if(unicaInstancia == null) {
			unicaInstancia = new ServicioJSON();
		}
		return unicaInstancia;
	}
	
	public JSONObject leerJSON(String nombreFichero) {
		File fichero = new File(nombreFichero);
    	StringBuffer cadenaLeida = new StringBuffer();
    	try {
			@SuppressWarnings("resource")
			FileReader lector = new FileReader(fichero);
			CharBuffer buffer = CharBuffer.allocate(1024*1024);
			lector.read(buffer);
			cadenaLeida.append(buffer.array());
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        JSONObject objetoJSON = new JSONObject(cadenaLeida.toString());
        return objetoJSON;
	}
	
	public JSONArray leerVariosJSONMismoFichero(String nombreFichero) {
		return null;
	}
	
	public JSONArray leerVariosJSONDesdeCadenaJSON(String cadenaJSON) {
		JSONArray objetoJSONArray = new JSONArray(cadenaJSON);
		return objetoJSONArray;
	}
	
	public boolean isJSONValido(JSONObject objetoJSON) {
		try {
        	JSONObject.testValidity(objetoJSON);
        	System.out.println("El fichero JSON es válido");
        	System.out.println(objetoJSON.toString());
        	return true;
		} catch (JSONException e) {
			System.out.println("El fichero JSON no es válido");
			return false;
		}
	}

}
