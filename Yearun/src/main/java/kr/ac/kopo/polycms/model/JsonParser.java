package kr.ac.kopo.polycms.model;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class JsonParser  {
   JSONParser jsonParser = new JSONParser();

   public User changeJson(String string) throws Exception {

      HashMap<String, Object> map = new HashMap<String, Object>();
      JSONParser jsonParser = new JSONParser();
      User vo = new User();

      JSONObject jsonObject = (JSONObject) jsonParser.parse(string);

      jsonObject = (JSONObject) jsonObject.get("response");
      System.out.println("JsonParser"+jsonObject);
//      map.put("userGender", jsonObject.get("gender"));
      map.put("id", jsonObject.get("id"));
      map.put("name", jsonObject.get("name"));
      map.put("nickname", jsonObject.get("nickname"));
      map.put("birthday", jsonObject.get("birthday"));
      
      
      vo.setName(map.get("name").toString());
      vo.setId(map.get("nickname").toString());// id -> vo.naver 넣기
      vo.setNickname(map.get("nickname").toString());
      vo.setAge(map.get("birthday").toString());
      vo.setPw("NaverLogin");
//      vo.setUserEmail(map.get("userId").toString()); // id -> vo.email 넣기
//      vo.setUserGender(map.get("userGender").toString()); // gender -> vo.gender 넣기

      
      return vo;
   }
}