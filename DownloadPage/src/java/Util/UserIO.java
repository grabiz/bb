/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import Model.User;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author NGUYEN
 */
public class UserIO {
    public static User getUserfromPath(String path, String email)
    {
        
        File file =new File(path);
        try {
            BufferedReader reader = new BufferedReader(new FileReader(file));
            String line = reader.readLine();
            while(line!=null)
            {
                String part[]= line.split(",");
                if(part[0].equals(email))
                {
                   User user = new User(part[0],part[1],part[2]);
                   return user;
                }
            
            }
            return null;
        } catch (FileNotFoundException ex) {
            Logger.getLogger(UserIO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        } catch (IOException ex) {
            Logger.getLogger(UserIO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
         
    }
    public static void addUsertoFile(String path,User user){
        File file = new File(path);
        try {
            BufferedWriter writer = new BufferedWriter(new FileWriter(file));
            String writetofile = user.getEmail()+","+user.getFirstname()+","+user.getLastname()+"\n";
            writer.write(writetofile);
            
            writer.close();
        } catch (IOException ex) {
            Logger.getLogger(UserIO.class.getName()).log(Level.SEVERE, null, ex);
        }
    
    }
}
