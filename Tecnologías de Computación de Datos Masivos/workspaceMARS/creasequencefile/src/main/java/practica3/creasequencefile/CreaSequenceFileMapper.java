package practica3.creasequencefile;

import java.io.IOException;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class CreaSequenceFileMapper extends Mapper<Text, Text, Text, Text> {

	@Override
	public void map(Text key, Text value, Context ctxt) throws IOException, InterruptedException {
		String[] campos = value.toString().split(",");
		if (!key.toString().equals("\"PATENT\"")) {
			Text keySequence = new Text(campos[3].replace("\"", ""));
			Text valueSequence = new Text(key + "," + campos[0]);
			ctxt.write(keySequence, valueSequence);
		}
	}
}
