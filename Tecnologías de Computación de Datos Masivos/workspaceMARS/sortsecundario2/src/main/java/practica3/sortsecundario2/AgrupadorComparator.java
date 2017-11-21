package practica3.sortsecundario2;

import org.apache.hadoop.io.WritableComparable;
import org.apache.hadoop.io.WritableComparator;

public class AgrupadorComparator extends WritableComparator {
	protected AgrupadorComparator() {
		super(PaisAnho.class, true);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public int compare(WritableComparable w1, WritableComparable w2) {
		PaisAnho pa1 = (PaisAnho) w1;
		PaisAnho pa2 = (PaisAnho) w2;
		return pa1.getPais().compareTo(pa2.getPais());
	}
}
