/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Calculate;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 *
 * @author NemoVinh
 */
public class connectpython {
    
    public double calculatdistance(String num1, String num2, String num3, String num4) throws IOException
    {
         String scriptPath = "C:/users/user/Desktop/caldistance.py";
            String[] cmd = new String[6];
            cmd[0] = "python";
            cmd[1] = scriptPath;
            cmd[2] = num1;
            cmd[3] = num2;
            cmd[4] = num3;
            cmd[5] = num4;
             // create runtime to execute external command
            Runtime rt = Runtime.getRuntime();
            Process pr = rt.exec(cmd);

            // retrieve output from python script
            BufferedReader bfr = new BufferedReader(new InputStreamReader(pr.getInputStream()));
            String line;
            

            if ((line = bfr.readLine()) != null) {
                return Double.parseDouble(line);
            }
            return 0;
    }
}
