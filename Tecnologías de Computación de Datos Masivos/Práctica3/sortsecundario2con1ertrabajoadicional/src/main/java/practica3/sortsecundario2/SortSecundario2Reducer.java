package practica3.sortsecundario2;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

public class SortSecundario2Reducer extends Reducer<PaisAnho, IntWritable, Text, Text> {
	
	Map<String, String> mapaPaises;
	
	@Override
	protected void setup(org.apache.hadoop.mapreduce.Reducer<PaisAnho,IntWritable,Text,Text>.Context context) throws IOException ,InterruptedException {
		File codigos = new File("country_codes.txt");
		FileReader lector = new FileReader(codigos);
		@SuppressWarnings("resource")
		BufferedReader buffer = new BufferedReader(lector);
		mapaPaises = new HashMap<String,String>();
		String linea;
		while ((linea = buffer.readLine()) != null) {
			String [] codigoPais = linea.split("\t");
			//System.out.println(codigoPais[0]);
			if(codigoPais[0].length() == 2)
				mapaPaises.put(codigoPais[0], codigoPais[1]);
		}
	}
	
	@Override
	public void reduce(PaisAnho key, Iterable<IntWritable> values, Context ctxt) throws IOException, InterruptedException {
		String cadena = "";
		for (IntWritable value : values) {
			cadena += key.getAnho().toString() + "->" + String.valueOf(value.get()) + ";";
		}
		ctxt.write(new Text(mapaPaises.get(key.getPais().toString())), new Text(cadena));
	}
}
