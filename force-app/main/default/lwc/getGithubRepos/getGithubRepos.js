import { LightningElement, wire } from 'lwc';
import getGithubRepos from '@salesforce/apex/githubRepoController.getGithubRepos';

export default class GetGithubRepos extends LightningElement {

    // 1. user wire to catch the output from apex methods
    @wire(getGithubRepos)
    repos(data, error){
        // 2. lofs the response
        if(data) {
            console.log('DATA--', JSON.stringify(data));
        } else if(error) {
            console.log('ERROR--', JSON.stringify(error));
        }
    }

}