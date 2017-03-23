/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

/**
 *
 * @author NGUYEN
 */
public class GetRealPath {
    public static String getRealPath()
    {
            String scheme = "request.getScheme() + \"://\"";
            String serverName = "request.getServerName()";
            String serverPort = "(request.getServerPort() == 80) ? \"\" : \":\" + request.getServerPort()";
            String contexPath = "request.getContextPath()";
            String urlString = scheme + serverName + serverPort + contexPath;
           
            return urlString;
    
    }
            
}
