package kr.ac.kopo.polycms.dao;

import kr.ac.kopo.polycms.model.User;

public interface UserDao {

   
boolean login(User user);

   void memberAdd(User user);

   int idChk(String id);

   int nameChk(String name);

   int selectNaver(User vo);

   void insertNaver(User vo);

User userInfo(String id);

void mypageUpdate(User user);

void deleteUser(String id);



}