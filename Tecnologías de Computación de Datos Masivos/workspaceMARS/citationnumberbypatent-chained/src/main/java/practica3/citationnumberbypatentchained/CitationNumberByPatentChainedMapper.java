package practica3.citationnumberbypatentchained;

import java.io.IOException;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class CitationNumberByPatentChainedMapper extends Mapper<Text, Text, Text, IntWritable> {
	
	private final static IntWritable one = new IntWritable(1);
	
	@Override
	public void map(Text key, Text value, Context ctxt) throws IOException, InterruptedException {
		String [] patents = value.toString().split(",");
		for (@SuppressWarnings("unused") String patent : patents) {
			ctxt.write(key, one);
			//System.out.println(key + "," + patent);
		}
	}
}
