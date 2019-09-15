package kr.ac.kopo.polycms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.polycms.dao.UserDao;
import kr.ac.kopo.polycms.model.User;
@Service
public class UserServiceImpl implements UserService {
@Autowired
UserDao dao;
   
   
   @Override
   public boolean login(User user) {
      return dao.login(user);
   }

   @Override
   public void memberAdd(User user) {
      dao.memberAdd(user);
   }

   @Override
   public int selectNaver(User vo) {
      // TODO Auto-generated method stub
      return dao.selectNaver(vo);
   }

   @Override
   public void insertNaver(User vo) {
      // TODO Auto-generated method stub
      dao.insertNaver(vo);
   }

   @Override
   public int idChk(String id) {
      
      return dao.idChk(id);
      
   }

   @Override
   public int nameChk(String name) {
      // TODO Auto-generated method stub
      return dao.nameChk(name);
   }

@Override
public User userInfo(String id) {
	
	return dao.userInfo(id);
}

@Override
public void mypageUpdate(User user) {
	dao.mypageUpdate(user);
}

@Override
public void deleteUser(String id) {
	// TODO Auto-generated method stub
	dao.deleteUser(id);
}


   

}