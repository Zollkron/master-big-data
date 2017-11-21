package hdfs;

import java.net.URI;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IOUtils;

public class FileSystemCat {
	public static void main(String[] args) throws Exception {
		String uri = args[0];
		// Configuracion por defecto
		Configuration conf = new Configuration();
		// Objeto para acceder al filesystem HDFS
		FileSystem fs = FileSystem.get(URI.create(uri), conf);
		// InputStream
		FSDataInputStream in = null;
		try {
			// Abre el FSDataInputStream con el PATH indicado
			in = fs.open(new Path(uri));
			// Copia de un stream a otro, con un buffer de 4096 bytes
			// No cierra los buffers al terminar(false)
			IOUtils.copyBytes(in, System.out, 4096, false);
		} finally {
			IOUtils.closeStream(in);
		}
	}
}
