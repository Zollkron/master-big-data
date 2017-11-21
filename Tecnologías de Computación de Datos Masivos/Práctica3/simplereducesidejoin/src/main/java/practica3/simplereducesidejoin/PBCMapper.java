package practica3.simplereducesidejoin;

import java.io.IOException;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class PBCMapper extends Mapper<Text, Text, LongWritable, TaggedText> {
	
	@Override
	public void map(Text key, Text value, Context ctxt) throws IOException, InterruptedException {
		String [] valores = value.toString().split(",");
		TaggedText textoCompuesto = new TaggedText(new Text("pais"), key);
		long valor = Long.valueOf(valores[0]);
		ctxt.write(new LongWritable(valor), textoCompuesto);
	}
}
