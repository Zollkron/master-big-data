package practica3.simplereducesidejoin;

import java.io.IOException;

import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class CNBPTaggedMapper extends Mapper<Text, Text, LongWritable, TaggedText> {

	@Override
	public void map(Text key, Text value, Context ctxt) throws IOException, InterruptedException {
		String[] patents = value.toString().split(",");
		TaggedText textoCompuesto = new TaggedText(new Text("ncitas"), new Text(String.valueOf(patents.length)));
		long valor = Long.valueOf(key.toString());
		ctxt.write(new LongWritable(valor), textoCompuesto);
	}
}
