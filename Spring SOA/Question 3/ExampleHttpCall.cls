public class ExampleHttpCall {

    public static void makeHttpCallout() {
        String endpoint = 'https://jsonplaceholder.typicode.com/posts'; // took from the response given

        // Create an HTTP request
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');

        // Create an HTTP object to send the request
        Http http = new Http();
        
        try {
            // Send the request and get the response
            HttpResponse response = http.send(request);        
            
            if (response.getStatusCode() == 200) {               
            // Parse and print the response body
                String responseBody = response.getBody();
                System.debug('HTTP Response Body: ' + responseBody);
            } else {
                System.debug('HTTP Request failed with status code: ' + response.getStatusCode());
            }

        } catch (Exception e) {
            System.debug('Error making HTTP request: ' + e.getMessage());
        }
    }
}
// we can hit the request by ExampleHttpCall.makeHttpCallout();