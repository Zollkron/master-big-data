package practica3.sortsecundario;

import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Partitioner;

public class PaisPartitioner extends Partitioner<PaisAnho, Text> {
	@Override
	public int getPartition(PaisAnho key, Text value, int numPartitions) {
		int hash = key.getPais().hashCode();
		int partition = hash % numPartitions;
		return partition;
	}
}
