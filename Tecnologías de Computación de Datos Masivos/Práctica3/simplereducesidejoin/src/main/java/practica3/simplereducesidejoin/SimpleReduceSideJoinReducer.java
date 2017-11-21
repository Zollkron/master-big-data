package practica3.simplereducesidejoin;

import java.io.IOException;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

public class SimpleReduceSideJoinReducer extends Reducer<LongWritable, TaggedText, LongWritable, Text> {
	@Override
	public void reduce(LongWritable key, Iterable<TaggedText> values, Context ctxt) throws IOException, InterruptedException {
		String pais = "No disponible";
		String ncitas = "0";
		for (TaggedText value : values) {
			if(value.getEtiqueta().toString().equals("pais")) {
				pais = value.getTexto().toString();
			} else {
				ncitas = value.getTexto().toString();
			}
		}
		ctxt.write(key, new Text(pais + "," + ncitas));
	}
}
