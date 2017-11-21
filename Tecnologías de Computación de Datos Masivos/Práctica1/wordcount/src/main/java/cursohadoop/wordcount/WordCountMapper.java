package cursohadoop.wordcount;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class WordCountMapper extends Mapper<LongWritable, Text, Text, IntWritable> {
	@Override
	public void map(LongWritable key, Text value, Context ctxt) throws IOException, InterruptedException {
		Matcher matcher = pat.matcher(value.toString());
		while (matcher.find()) {
			word.set(matcher.group().toLowerCase());
			ctxt.write(word, one);
		}
	}

	private Text word = new Text();
	private final static IntWritable one = new IntWritable(1);
	private Pattern pat = Pattern.compile("\\b[a-zA-Z\\u00C0-\\uFFFF]+\\b");
}
