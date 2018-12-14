class ProjectDatabaseService {
    static getProjects() {
         return this.loadProjectsFromAPI()
                     .then(json => Promise.all(json).then(data => data));
    }

    static loadProjectsFromAPI() {
        let projects = this.loadProjectsFromLocalStorage();
        
        return new Promise(
            (resolve, reject) => {
                    resolve(projects);        
            }
        );

        // let projectRequests = projectIds.map((id) =>
        //     fetch('https://zhaw-issue-tracker-api.herokuapp.com/api/projects/' + id)
        // );

        // return Promise.all(projectRequests)
        //     .then(responses => responses.map(data => data.json()));
    }

    static saveProject(project) {
        this.updateProjectObject(project);
        this.saveProjectToLocalStorage(project);

        return new Promise(
            (resolve, reject) => {
                resolve(project);        
            }
        );

        // return fetch("https://zhaw-issue-tracker-api.herokuapp.com/api/projects/", {
        //     method: "POST",
        //     body: JSON.stringify(newProject),
        //     headers: {
        //     "Content-Type": "application/json; charset=utf-8",
        //     }
        // }).then(response =>
        //         response.json().then((json) => {
        //             return json;
        //         })
        // ).catch(err => console.log(err));
    }

    static updateProjectObject(project) {
        let date = new Date().toISOString();

        project.id = 0;
        project.client_id = this.uuid();
        project.created_at = date;
        project.updated_at = date;
     }

     static uuid() {
        return crypto.getRandomValues(new Uint32Array(4)).join('-');
    }

     // LocalStorage
     static loadProjectsFromLocalStorage() {
         let result = [];
         let localStorageArray = JSON.parse(localStorage.getItem('projects')) || [];
         localStorageArray.forEach(project => {
            // Check if the saved data is a correct Project
            // If yes, add it. If no skip this object, since it is faulty
            if (project.id != undefined || project.client_id != undefined) {
                result.push(project);
            }
         });

        return result;
    }

    static saveProjectToLocalStorage(project) {
        let projects = this.loadProjectsFromLocalStorage();
        projects.push(project);
        localStorage.setItem('projects', JSON.stringify(projects));
    }
}
