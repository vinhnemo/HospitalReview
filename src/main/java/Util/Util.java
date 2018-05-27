/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import Database.AsymmetricCryptography;
import com.google.gson.Gson;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.SecureRandom;
import org.apache.commons.lang3.RandomStringUtils;

/**
 *
 * @author TGMaster
 */
public class Util {

    private static final Gson gson = new Gson();

    public static String toJson(Object obj) {
        return gson.toJson(obj);
    }

    public static String encrypt(String msg) {

        try {
            AsymmetricCryptography ac = new AsymmetricCryptography();
            PrivateKey privateKey = ac.getPrivate("KeyPair/privateKey");
            return ac.encryptText(msg, privateKey);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return null;
    }

    public static String decrypt(String msg) {

        try {
            AsymmetricCryptography ac = new AsymmetricCryptography();
            PublicKey publicKey = ac.getPublic("KeyPair/publicKey");
            return ac.decryptText(msg, publicKey);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return null;
    }
    
    public static String generateRandomStr(int length) {
        char[] possibleCharacters = ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789").toCharArray();
        String randomStr = RandomStringUtils.random(length, 0, possibleCharacters.length - 1, false, false, possibleCharacters, new SecureRandom());

        return randomStr;
    }
}
