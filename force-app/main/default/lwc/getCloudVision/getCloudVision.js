import { LightningElement, wire } from 'lwc';
import getCloudVisionResponse from '@salesforce/apex/googleCloudVisionController.getCloudVisionResponse';

export default class GetCloudVision extends LightningElement {

    data = [];
    
    handleCloudVisionResponse(){
        getCloudVisionResponse()
        .then( (response) => {
            this.data = response;
            console.log('SUCESS',response);
        })
        .catch( (error) => {
            this.data = error;
            console.log('ERROR',error);
        });
    }
}