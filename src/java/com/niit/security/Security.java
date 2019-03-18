package com.niit.security;

import java.security.MessageDigest;

public class Security 
{
    public static String md5(String toEncrypt)
    {
        try {
              final MessageDigest digest = MessageDigest.getInstance("md5");
              digest.update(toEncrypt.getBytes());
              final byte[] bytes = digest.digest();
              final StringBuilder sb = new StringBuilder();
              for (int i = 0; i < bytes.length; i++) 
              {
                  sb.append(String.format("%02X", bytes[i]));
              }
              String k = sb.toString().toLowerCase();
              String d = k.replace("0",k).replace("1",k.substring(2,6));
              return d;
            } catch (Exception exception) {
            return ""; 
        }
    }    
}


