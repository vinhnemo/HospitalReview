/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Calculate;

import java.util.Map;

/**
 *
 * @author NemoVinh
 */
public class GetCoordinate {

    static String address = "The White House, Washington DC";

    public static void main(String[] args) {
        Map<String, Double> coords;
        coords = OpenStreetMapUtils.getInstance().getCoordinates(address);
        System.out.println("latitude :" + coords.get("lat"));
        System.out.println("longitude:" + coords.get("lon"));
    }
}