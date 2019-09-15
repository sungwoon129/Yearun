package kr.ac.kopo.polycms.model;

import java.util.List;

public class BucketList {
	
private List<Bucket> bucketList;

public List<Bucket> getBucketList() {
	return bucketList;
}

public void setBucketList(List<Bucket> bucketList) {
	this.bucketList = bucketList;
}

@Override
public String toString() {
	return "BucketList [bucketList=" + bucketList + "]";
}



}
