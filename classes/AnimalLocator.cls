public class AnimalLocator {
    public static String getAnimalNameById(Integer AnimalId){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+AnimalId);
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json');
        String animalName='';
        HttpResponse response = http.send(request);
        System.debug('Response: '+response.getBody());
        if(response.getStatusCode() == 200){
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            System.debug('Result: '+results);
            Map<String, Object> animal = (Map<String, Object>)results.get('animal');
            System.debug('Animal: '+animal);
            if(animal != null)	animalName = String.valueOf(animal.get('name'));
        }else{
            system.debug('Error: '+response.getBody()); 
        }
        return animalName;
    }
}