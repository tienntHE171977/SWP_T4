/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller_Authen;

import DAL_Authen.AccountDAO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import constant.Iconstant;
import java.io.IOException;
import model.User;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

/**
 *
 * @author FPT
 */
public class Google_Login {
    public static String getToken(String code) throws ClientProtocolException, IOException {
        String response = Request.Post(Iconstant.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(
                        Form.form()
                                .add("client_id", Iconstant.CLIENT_ID)
                                .add("client_secret", Iconstant.CLIENT_SECRET)
                                .add("redirect_uri", Iconstant.REDIRECT_URI)
                                .add("code", code)
                                .add("grant_type", Iconstant.GRANT_TYPE)
                                .build()
                )
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").getAsString();
        return accessToken;
    }

    public static User getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Iconstant.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        // Ánh xạ thông tin JSON từ Google thành JsonObject
        JsonObject googleUser = new Gson().fromJson(response, JsonObject.class);

        // Tạo đối tượng Account và ánh xạ dữ liệu
        User account = new User();
        account.setEmail(googleUser.get("email").getAsString());
        
        account.setImage(googleUser.get("picture").getAsString());

        return account;
    }
}
