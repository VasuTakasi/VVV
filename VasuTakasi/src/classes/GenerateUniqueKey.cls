public with sharing class GenerateUniqueKey {
  private static final Integer KEY_LENGTH = 25;
  public static String generateKey(String type){
    String orgId = UserInfo.getOrganizationId();
    String salt = String.valueOf(Crypto.getRandomLong());
    Blob aes;

    if(type == 'MAC'){
      aes = Crypto.generateMac('HmacMD5', Blob.valueOf(salt), Blob.valueOf(orgId));
    }else if(type == 'DIGEST'){
      String timeNowInMillisecond = System.now().format('YYYY-MM-DD HH:mm:ss:SSS a');
      Blob targetBlob = Blob.valueOf(orgId + salt + timeNowInMillisecond);
      aes = Crypto.generateDigest('MD5', targetBlob);
    }

    String randomValue = EncodingUtil.convertToHex(aes).left(KEY_LENGTH);
    return randomValue;
  }
}