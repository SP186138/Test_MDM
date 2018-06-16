import java.io.*;
   import java.util.*;
   
   public class DoProcessBuilder {
	  

	 public static Integer tssRouteCleanse() throws IOException {

            String[] command = {"cmd", "/c", "start", "TSSRouteCleanse.bat"};
            ProcessBuilder pb = new ProcessBuilder(command);
            Process p = pb.start();
			Integer a = 0;
			return a;
			
     }

	 public static Integer tssMatch() throws IOException {

            String[] command = {"cmd", "/c", "start", "TSSMatch.bat"};
            ProcessBuilder pb = new ProcessBuilder(command);
            Process p = pb.start();
			Integer a = 0;
			return a;
			
     }


    } 