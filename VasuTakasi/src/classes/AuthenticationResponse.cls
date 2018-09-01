public class AuthenticationResponse{
	public String access_token;	//00Dc0000003kRUf!ARAAQEV2RM7.t_IvfOgNt5RHoshWdIMOjaUR4f_P2gjhTkWmQSvDUAcbNqdPHBb9saOuYjtViv4fk0_4gOB5bLu.srdNzqBz
	public String instance_url;	//https://cs14.salesforce.com
	public String id;	//https://test.salesforce.com/id/00Dc0000003kRUfEAM/00540000003dutMAAQ
	public String token_type;	//Bearer
	public String issued_at;	//1515674219404
	public String signature;	//Jj2UhENrBfLg3+bSV1s+fgMgU5Ag6AEbur823wr6JNI=
	public static AuthenticationResponse parse(String json){
		return (AuthenticationResponse) System.JSON.deserialize(json, AuthenticationResponse.class);
	}
}