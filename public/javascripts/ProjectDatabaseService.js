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
    }

    static saveProject(project) {
        this.updateProjectObject(project);
        this.saveProjectToLocalStorage(project);

        fetch("https://zhaw-issue-tracker-api.herokuapp.com/api/projects/", {
            method: "POST",
            body: JSON.stringify(project),
            headers: {
            "Content-Type": "application/json; charset=utf-8",
            }
        }).then(response =>
                response.json().then((json) => {
                    this.updateProjectIdToLocalStorage(json);
                })
        ).catch(err => console.log(err));

        return new Promise(
            (resolve, reject) => {
                resolve(project);        
            }
        );
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

    static updateProjectIdToLocalStorage(project) {
        let projects = this.loadProjectsFromLocalStorage();
        projects.forEach(savedProject => {
            if (savedProject.client_id == project.client_id) {
                savedProject.id = project.id;
            }
        });
        localStorage.setItem('projects', JSON.stringify(projects));
    }
}
