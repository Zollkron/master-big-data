package practica3.sortsecundario;

import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.mapreduce.Reducer;

public class SortSecundarioReducer extends Reducer<PaisAnho, IntWritable, PaisAnho, IntWritable> {
	@Override
	public void reduce(PaisAnho key, Iterable<IntWritable> values, Context ctxt) throws IOException, InterruptedException {
		int sum = 0;
		for (IntWritable value : values) {
			sum += value.get();
		}
		ctxt.write(key, new IntWritable(sum));
	}
}
