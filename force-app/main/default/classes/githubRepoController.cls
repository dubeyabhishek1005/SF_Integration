public with sharing class githubRepoController {

    public static final string endpoint = 'https://api.github.com/users/force-app/repos';
    public githubRepoController() {
        // constructor code here - will use it later.
    }

    @AuraEnabled(cacheable = true)
    public static string getGithubRepos(){
        try {
            // 1. instantiate a HHTP class
            HTTP http = new HTTP();

            // 2. make a request
            HttpRequest req = new HttpRequest();
            req.setMethod('GET');
            req.setEndpoint(endpoint);

            // 3. receive a response
            HttpResponse res = new HttpResponse();
            res = http.send(req);

            if (res.getStatusCode() == 200){
                return res.getBody();
            }
            return 'Error: ' + res.getStatusCode() + ' ' + res.getStatus();

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
}