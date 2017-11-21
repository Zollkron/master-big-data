package practica3.citingpatents;

import java.io.IOException;

import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

public class CitingPatentsReducer extends Reducer<Text, Text, Text, Text> {
	@Override
	public void reduce(Text key, Iterable<Text> values, Context ctxt) throws IOException, InterruptedException {
		String cadena = "";
		for (Text value : values) {
			if(values.iterator().hasNext()) {
				cadena = cadena + value.toString() + ",";
			} else {
				cadena = cadena + value.toString();
			}
		}
		ctxt.write(key, new Text(cadena));
	}
}
