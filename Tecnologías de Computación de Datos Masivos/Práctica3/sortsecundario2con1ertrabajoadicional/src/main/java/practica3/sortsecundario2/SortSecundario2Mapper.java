package practica3.sortsecundario2;

import java.io.IOException;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class SortSecundario2Mapper extends Mapper<Text, Text, PaisAnho, IntWritable> {
	
	private final static IntWritable one = new IntWritable(1);
	
	@Override
	public void map(Text key, Text value, Context ctxt) throws IOException, InterruptedException {
		String [] valores = value.toString().split(",");
		PaisAnho claveCompuesta = new PaisAnho(key, new Text(valores[1]));
		ctxt.write(claveCompuesta, one);
	}
}
