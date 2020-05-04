package insy;

/**
 * An Instance of this class represents a Song
 * @author Phillip Przidal
 * @since 2020-05-04
 */
public class Song {
	private String name, duration;
	
	public Song(String name, String duration) {
		setDuration(duration);
		setName(name);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		if(name == null) throw new IllegalArgumentException("no");
		this.name = name.substring(name.indexOf('>') + 1);
		this.name = this.name.substring(0, this.name.indexOf('<'));
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		if(duration == null) throw new IllegalArgumentException("no");
		// Process this line so that we get the Duration without html code
		this.duration = duration.substring(duration.indexOf('>') + 1, duration.lastIndexOf('<'));
	}
}
