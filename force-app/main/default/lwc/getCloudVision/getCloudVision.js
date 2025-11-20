import { LightningElement, wire } from 'lwc';
import getCloudVisionResponse from '@salesforce/apex/googleCloudVisionController.getCloudVisionResponse';
import getCloudVisionResponseJSON from '@salesforce/apex/googleCloudVisionController.getCloudVisionResponseJSON';

export default class GetCloudVision extends LightningElement {

    data = [];
    dataJSON = [];
    
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

    handleCloudVisionResponseJSON(){
        getCloudVisionResponseJSON()
        .then( (response) => {
            this.dataJSON = response;
            console.log('SUCESS',response);
        })
        .catch( (error) => {
            this.dataJSON = error;
            console.log('ERROR',error);
        });
    }
}