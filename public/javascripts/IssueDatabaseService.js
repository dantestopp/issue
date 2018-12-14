const DELETE = "DELETE";
const UPDATE = "PUT";

class IssueDatabaseService {
    static getIssuesFromProject(projectClientId) {
        return this.loadIssuesFromAPI(projectClientId).then(data => data);
    }

    static loadIssuesFromAPI(projectClientId) {        
        let issues = this.loadIssuesFromLocalStorage(projectClientId);
        
        return new Promise(
            (resolve, reject) => {
                    resolve(issues);        
            }
        );

        // return fetch('https://zhaw-issue-tracker-api.herokuapp.com/api/projects/' + projectId + "/issues")
        //     .then(response => response.json());
    }

    static sendIssueToAPI(issue, type) {
        return fetch("https://zhaw-issue-tracker-api.herokuapp.com/api/projects/" + issue.project_id + "/issues/" + issue.id, {
            method: type,
            body: JSON.stringify(issue),
            headers: {
                "Content-Type": "application/json; charset=utf-8",
            }
        });
    }

    static saveIssue(issue) {
        this.updateIssueObject(issue);
        this.saveIssueToLocalStorage(issue);

        // fetch("https://zhaw-issue-tracker-api.herokuapp.com/api/projects/" + projectId + "/issues", {
        //     method: "POST",
        //     body: JSON.stringify(issue),
        //     headers: {
        //     "Content-Type": "application/json; charset=utf-8",
        //     }
        // });
    }

    static updateIssue(issue) {
        this.updateIssueInLocalStorage(issue);
        // return this.sendIssueToAPI(issue, UPDATE);
    }

    static deleteIssue(issue) {
        this.deleteIssueInLocalStorage(issue);
        
        return new Promise(
            (resolve, reject) => {
                    resolve(issue);        
            }
        );

        // return this.sendIssueToAPI(issue, DELETE);
    }

    static updateIssueObject(issue) {
        let date = new Date().toISOString();

        issue.id = 0;
        issue.project_id = 0; // TODO
        issue.client_id = this.uuid();
        issue.created_at = date;
        issue.updated_at = date;
    }

    static uuid() {
       return crypto.getRandomValues(new Uint32Array(4)).join('-');
    }

    // LocalStorage
    static loadIssuesFromLocalStorage(projectClientId) {
        let result = [];
        let localStorageArray = this.loadAllIssuesFromLocalStorage();
        localStorageArray.forEach(issue => {
            // only add issues belonging to the project
            if (issue.project_client_id == projectClientId) {
                result.push(issue);
            }
        });

       return result;
   }

   static loadAllIssuesFromLocalStorage() {
        let result = [];
        let localStorageArray = JSON.parse(localStorage.getItem('issues')) || [];
        localStorageArray.forEach(issue => {
            // Check if the saved data is a correct Project
            // If yes, add it. If no skip this object, since it is faulty
            if (issue.id != undefined || issue.client_id != undefined) {
                result.push(issue);            
            }
        });

        return result;
   }

   static saveIssueToLocalStorage(issue) {
       let issues = this.loadAllIssuesFromLocalStorage();
       issues.push(issue);
       localStorage.setItem('issues', JSON.stringify(issues));
   }   

   static updateIssueInLocalStorage(issue) {
        let issues = this.loadAllIssuesFromLocalStorage();
        issues.forEach(savedIssue => {
            if (savedIssue.client_id == issue.client_id) {
                savedIssue.done = issue.done;
            }
        });
        localStorage.setItem('issues', JSON.stringify(issues));
    }

    static deleteIssueInLocalStorage(issue) {
         let issues = this.loadAllIssuesFromLocalStorage();
         issues.splice(issues.findIndex((savedIssue) => savedIssue.client_id == issue.client_id), 1);
         localStorage.setItem('issues', JSON.stringify(issues));
     }
}
