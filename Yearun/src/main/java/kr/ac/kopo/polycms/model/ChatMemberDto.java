package kr.ac.kopo.polycms.model;

public class ChatMemberDto {
		int num;
		String id;
		String room;
		String priroom;
		
		public ChatMemberDto(String id, String room, String priroom) {
			this.id =id;
			this.room=room;
			this.priroom=priroom;
		}




	
		
		
	
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getRoom() {
			return room;
		}
		public void setRoom(String room) {
			this.room = room;
		}
		public String getPriroom() {
			return priroom;
		}
		public void setPriroom(String priroom) {
			this.priroom = priroom;
		}
		public int getNum() {
			return num;
		}
		public void setNum(int num) {
			this.num = num;
		}
//		
//		@Override
//		public String toString() {
//			return "ChatMemberDto[id="+id+",room="+room+",preroom+"+priroom+"]";
//			
//		}
//	
}
