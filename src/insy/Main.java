package insy;

import java.io.*;
import java.net.*;
import java.util.*;

/**
 * Discogs to INSY-Musikarchiv2020 Converter
 * This programm isnt particulary efficient but it works on my machine 
 * @author Phillip Przidal
 * @since 2020-05-04
 */
public class Main {
	// Change the Value of these Constants to adjust it to your needs
	private static final String URL = "https://www.discogs.com/Wham-Make-It-Big/release/3439549"; // Change these two
	private static final String INTERPRET = "Wham";
	private static final int AID = 2173;
	
	public static void main(String[] args) throws IOException {
		// Use this for more professional cli parseing: https://stackoverflow.com/questions/367706/how-do-i-parse-command-line-arguments-in-java
		/*if(args.length != 3) {
			System.err.println("Should get 3 Arguments. URL to discogs page AND interpret name AND filename to Append");
			System.exit(1);
		}*/
        BufferedReader in = new BufferedReader(new InputStreamReader((new URL(URL)).openStream()));
        Map<String, Song> map = new LinkedHashMap<>(); // Mapping Tracknumber to Song
        String inputLine, lastKey = "";
        while ((inputLine = in.readLine()) != null) { // Iterate over every line of html code of given URL (quite slow).
        	if(inputLine.contains("<td class=\"tracklist_track_pos\">")) {
        		lastKey = inputLine.substring(inputLine.indexOf('>') + 1, inputLine.lastIndexOf('<'));
        		map.put(lastKey, null);
        	} else if(inputLine.contains("<span class=\"tracklist_track_title\">")) { // Look for signal sign
            	in.readLine(); // .gitignore this line
            	map.put(lastKey, new Song(inputLine, in.readLine()));
            }
        }
        in.close();
        map.forEach((k, v) -> System.out.println("INSERT INTO song (iname, stitel) VALUES (\"" + INTERPRET + "\", \"" + v.getName() + "\");"));
        System.out.println("\n-- INSERTs INTO Table: songv");
        // Im assuming that all songs are shorter than 10:00
        map.forEach((k, v) -> System.out.println("INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('" + INTERPRET + "', '" + v.getName() + "', '', '00:0" + v.getDuration() + "', null);"));
        System.out.println("\n-- INSERTs INTO Table: ttracklist");
        map.forEach((k, v) -> System.out.println("INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (" + AID + ", 'CD', '1', '" + INTERPRET + "', '" + v.getName() + "', '', " + k + ", false);"));
	}
}
