import { LightningElement, wire } from 'lwc';
import getCloudVisionResponse from '@salesforce/apex/googleCloudVisionController.getCloudVisionResponse';

export default class GetCloudVision extends LightningElement {

    handleCloudVisionResponse(){
        getCloudVisionResponse()
        .then( (data) => {
            console.log('Success -- ', data);
        })
        .catch( (error) => {
            console.log('Failed -- ', error);
        });
    }
}