public class HPALMQCAuthenticator {
    public void test()
    {
        
    }
/*
 public class HPALMQCAuthenticator 
{
    public boolean signIn() {
        
        try {
            
            // Setup Cookie Handler manage Cookies returned from the server.
            CookieManager manager = new CookieManager();
            manager.setCookiePolicy(CookiePolicy.ACCEPT_ALL);
            CookieHandler.setDefault(manager);
            
            // The URL to authenticate user with HP ALM via REST looks like this:
            //      http://<server>:<port>/qcbin/api/authentication/sign-in
            // The request header needs to contain the following:
            //      content-type=application/json
            //      Authorization=Basic <username>:<password>
            //
            // Note that the username and password will need to be URLEncoded.
            String userAndPassword = this.almUser + ':' + this.almPassword;
            String signInUrlString = this.getAlmAPIURL() + '/authentication/sign-in';   
            URL signInURL = new URL(signInUrlString);
            this.conn = (HttpURLConnection)signInURL.openConnection();
            this.conn.setRequestMethod('POST');
            this.conn.addRequestProperty('Content-Type', 'application/json');
            this.conn.addRequestProperty('Accept', 'application/json');
            this.conn.addRequestProperty('Authorization', 'Basic ' + 
                    Base64.getEncoder().encodeToString(userAndPassword.getBytes()));
            this.conn.connect();
            
            // According to ALM REST API documentation, 200 response code will indicate success, while the 401 
            // response code will indicate that the user authentication failed.
            int responseCode = this.conn.getResponseCode();
            if (responseCode==401) {
                System.out.println('ALM REST Response Code: 401 - User is not authenticated. Please retry with different user/password.');
                return false;
            }
            
            if (responseCode!=200) {
                throw new RuntimeException('Failed: HTTP Error Code: ' + this.conn.getResponseCode());
                
            }
            
            this.conn.disconnect();
            return true;

        }
        catch (MalformedURLException e) {
            e.printStackTrace();
            System.out.println('Error encountered during instantiation of URL');
            return false;
        }
        catch (IOException ioe) {
            ioe.printStackTrace();
            System.out.println('IOException encountered during connection open');
            return false;
        }       
    }
}
 */
}