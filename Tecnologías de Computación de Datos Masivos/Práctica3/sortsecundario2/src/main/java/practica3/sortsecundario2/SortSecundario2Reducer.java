package practica3.sortsecundario2;

import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

public class SortSecundario2Reducer extends Reducer<PaisAnho, IntWritable, Text, Text> {
	@Override
	public void reduce(PaisAnho key, Iterable<IntWritable> values, Context ctxt) throws IOException, InterruptedException {
		String cadena = "";
		for (IntWritable value : values) {
			cadena += key.getAnho().toString() + "->" + String.valueOf(value.get()) + ";";
		}
		ctxt.write(new Text(key.getPais().toString()), new Text(cadena));
	}
}
