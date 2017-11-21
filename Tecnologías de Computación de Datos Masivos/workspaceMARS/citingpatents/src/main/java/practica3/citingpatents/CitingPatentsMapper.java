package practica3.citingpatents;

import java.io.IOException;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class CitingPatentsMapper extends Mapper<Text, Text, Text, Text> {

	@Override
	public void map(Text key, Text value, Context ctxt) throws IOException, InterruptedException {
		if (!key.toString().equals("\"CITING\"")) {
			ctxt.write(key, value);
			ctxt.write(value, key);
		}
	}
}
