/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Calculate;

/**
 *
 * @author NemoVinh
 */
import java.net.URLConnection;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;
import javax.xml.xpath.XPathConstants;
import org.w3c.dom.Document;

/**
 * This class will get the lat long values.
 */
public class LatitudeAndLongitudeWithPincode {

//    public static void main(String[] args) throws Exception {
//        System.setProperty("java.net.useSystemProxies", "true");
//        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
//        System.out.println("Please enter a location:");
//        String postcode = reader.readLine();
//        Location lol = new Location();
//        lol.setAddress(postcode);
//        LatitudeAndLongitudeWithPincode la = new LatitudeAndLongitudeWithPincode();
//        lol = la.getLatLongPositions(lol);
//        System.out.println("Latitude: " + lol.getLat() + " and Longitude: " + lol.getLng());
//    }
    public Location getLatLongPositions(Location loc) throws Exception {
        int responseCode = 0;
//       String address= "78 Giai Phong, Phuong Mai Ward, Dong Da District, Ha Noi";
        String address = loc.getAddress();
        String api = "https://maps.googleapis.com/maps/api/geocode/xml?address=" + URLEncoder.encode(address, "UTF-8") + "&key=AIzaSyBWCH6uWQbLO2KtBLx-_O-S2CYX-YmKApY";
        System.out.println("URL : " + api);
        URL url = new URL(api);
        HttpURLConnection httpConnection = (HttpURLConnection) url.openConnection();
        httpConnection.connect();
        responseCode = httpConnection.getResponseCode();
        if (responseCode == 200) {
            DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();;
            Document document = builder.parse(httpConnection.getInputStream());
            XPathFactory xPathfactory = XPathFactory.newInstance();
            XPath xpath = xPathfactory.newXPath();
            XPathExpression expr = xpath.compile("/GeocodeResponse/status");
            String status = (String) expr.evaluate(document, XPathConstants.STRING);
            if (status.equals("OK")) {
                expr = xpath.compile("//geometry/location/lat");
                String latitude = (String) expr.evaluate(document, XPathConstants.STRING);
                expr = xpath.compile("//geometry/location/lng");
                String longitude = (String) expr.evaluate(document, XPathConstants.STRING);
                loc.setLat(latitude);
                loc.setLng(longitude);

                return loc;
            } else {
                throw new Exception("Error from the API - response status: " + status);
            }
        }
        return null;
    }

}
