package kr.ac.kopo.polycms.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.polycms.model.User;
@Repository
public class UserDaoImpl implements UserDao {
   @Autowired
   SqlSession sql;
   
   
   @Override
   public boolean login(User user) {
      if(sql.selectOne("user.login", user) == null)
         return false;
         
      return true;
      }
   

   @Override
   public void memberAdd(User user) {
      sql.insert("user.add", user);
   }


   @Override
   public int idChk(String id) {
      
      return sql.selectOne("user.idChk",id);
      
   }


   @Override
   public int nameChk(String name) {
      // TODO Auto-generated method stub
      return sql.selectOne("user.nameChk",name);
   }


   @Override
   public int selectNaver(User vo) {
      // TODO Auto-generated method stub
      return sql.selectOne("user.idChk", vo);
   }


   @Override
   public void insertNaver(User vo) {
      sql.insert("user.add",vo);
      
   }


@Override
public User userInfo(String id) {
	return sql.selectOne("user.userInfo", id);
}


@Override
public void mypageUpdate(User user) {
	sql.update("user.mypageUpdate", user);
	
}


@Override
public void deleteUser(String id) {
	// TODO Auto-generated method stub
	sql.delete("user.deleteUser",id);
}

}