package practica3.simplereducesidejoin;

import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;

import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.Writable;

public class TaggedText implements Writable {

	private Text etiqueta;
	private Text texto;

	public TaggedText() {
		set(new Text(), new Text());
	}

	public TaggedText(Text etiqueta, Text texto) {
		set(etiqueta, texto);
	}

	public void set(Text etiqueta, Text texto) {
		this.etiqueta = etiqueta;
		this.texto = texto;
	}

	public Text getEtiqueta() {
		return etiqueta;
	}

	public Text getTexto() {
		return texto;
	}

	@Override
	public void readFields(DataInput in) throws IOException {
		etiqueta.readFields(in);
		texto.readFields(in);
	}

	@Override
	public void write(DataOutput out) throws IOException {
		etiqueta.write(out);
		texto.write(out);
	}

	@Override
	public int hashCode() {
		return etiqueta.hashCode() * 163 + texto.hashCode();
	}

	@Override
	public boolean equals(Object o) {
		if (o instanceof TaggedText) {
			TaggedText pa = (TaggedText) o;
			return etiqueta.equals(pa.etiqueta) && texto.equals(pa.texto);
		}
		return false;
	}

	@Override
	public String toString() {
		return etiqueta + "," + texto;
	}
}
