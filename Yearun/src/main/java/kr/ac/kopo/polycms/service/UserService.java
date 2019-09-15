package kr.ac.kopo.polycms.service;

import kr.ac.kopo.polycms.model.User;

public interface UserService {

   boolean login(User user);

   void memberAdd(User user);

   int selectNaver(User vo);

   void insertNaver(User vo);

   int idChk(String id);

   int nameChk(String name);

User userInfo(String id);

void mypageUpdate(User user);

void deleteUser(String id);

  
}