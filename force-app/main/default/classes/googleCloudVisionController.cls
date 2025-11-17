public with sharing class googleCloudVisionController {

    public static final String cloudVisionAPIKey = 'AIzaSyBPiX0IULSaq-YWYlgIxql8mzxHYWJUXCI';
    public static final String cloudVisionAPIEndpoint = 'https://vision.googleapis.com/v1/images:annotate?key=' + cloudVisionAPIKey;

    public googleCloudVisionController() {
        // will use it later.
    }

    /*
    How to Integrate Google Cloud Vision API with Salesforce.
        1. Create a Google Cloud Project
        2. Enable the Google Cloud Vision API
        3. Create Credential & Create API Key
    */

    @AuraEnabled(cacheable = true) 
    public static string getCloudVisionResponse(){
        try {

            HTTP http = new HTTP();

            HttpRequest req = new HttpRequest();
            req.setEndpoint(cloudVisionAPIEndpoint);
            req.setMethod('POST');
            // since the method is POST, we need to set the body
            req.setBody('{ "requests": [ { "features": [ { "maxResults": 5, "type": "LABEL_DETECTION" } ], "image": { "source": { "imageUri": "gs://cloud-samples-data/vision/label/setagaya.jpeg" } } } ] }');

            // if you are setting the body as JSON, you need to set the header
            req.setHeader('Content-Type', 'application/json');

            HttpResponse res = new HttpResponse();
            res = http.send(req);

            if (res.getStatusCode() == 200){
                // now since the data came in JSON format, we need to parse it
                // to parse the JSON, we need to use JSON.deserializeUntyped method
                // JSON.deserializeUntyped method will return a map of string and object
                // we can then use the map to get the data we need

                Map<String, Object> responseMap = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
                List<Object> firstResponseList = (List<Object>)responseMap.get('responses');
                Map<String, Object> firstResponseMap = (Map<String, Object>)firstResponseList[0];
                List<Object> labelAnnotationsList = (List<Object>)firstResponseMap.get('labelAnnotations');

                for(Object annotations: labelAnnotationsList){
                    Map<String, Object> annotationMap = (Map<String, Object>)annotations;
                    String description = (String)annotationMap.get('description');
                    Decimal score = (Decimal)annotationMap.get('score');
                    Decimal topicality = (Decimal)annotationMap.get('topicality');
                    System.debug('Description: ' + description + ' Score: ' + score + ' Topicality: ' + topicality);
                }
                return res.getBody();
            }
            return 'Something went wrong' + res.getBody();

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
}

/*

Data that came from the response is in JSON format below.
"responses": [
    {
      "labelAnnotations": [
        {
          "mid": "/m/019sc6",
          "description": "Lighting",
          "score": 0.93847865,
          "topicality": 0.004671876
        },
        {
          "mid": "/m/01d74z",
          "description": "Night",
          "score": 0.9260216,
          "topicality": 0.19172658
        },
        {
          "mid": "/m/01c8br",
          "description": "Street",
          "score": 0.9031698,
          "topicality": 0.049043708
        },
        {
          "mid": "/m/02lts",
          "description": "Electricity",
          "score": 0.90275687,
          "topicality": 0.00555699
        },
        {
          "mid": "/m/01lwf0",
          "description": "Alley",
          "score": 0.85344094,
          "topicality": 0.43568867
        }
      ]
    }
  ]

*/