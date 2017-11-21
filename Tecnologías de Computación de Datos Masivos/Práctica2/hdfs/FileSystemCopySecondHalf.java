package hdfs;

import java.net.URI;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.FSDataOutputStream;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IOUtils;

public class FileSystemCopySecondHalf {
	public static void main(String[] args) throws Exception {
		String uri = args[0];
		String uri2 = args[1];
		// Configuracion por defecto
		Configuration conf = new Configuration();
		// Objeto para acceder al filesystem HDFS
		FileSystem fs = FileSystem.get(URI.create(uri), conf);
		FileSystem fs2 = FileSystem.get(URI.create(uri2), conf);
		// InputStream
		FSDataInputStream in = null;
		FSDataOutputStream out = null;
		try {
			Path ficheroEntrada = new Path(uri);
			// Abrimos el FSDataInputStream con el primer PATH indicado
			in = fs.open(ficheroEntrada);
			// Abrimos el FSDataOutputStream con el segundo PATH indicado
			out = fs2.create(new Path(uri2));
			//Obtenemos la longitud del fichero de entrada
			long longitudFichero = 0;
			//Para ello primero obtenemos el status del fichero
			FileStatus estadoFichero = fs.getFileStatus(ficheroEntrada);
			//Asignamos la longitud del mismo a una variable de tipo long
			longitudFichero = estadoFichero.getLen();
			//Hacemos que el cursor del fichero salte a la mitad del mismo
			in.seek(longitudFichero/2);
			// Copia de un stream a otro, con un buffer de 4096 bytes
			// No cierra los buffers al terminar(false)
			IOUtils.copyBytes(in, out, 4096, false);
		} finally {
			IOUtils.closeStream(in);
			IOUtils.closeStream(out);
		}
	}
}

