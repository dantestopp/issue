class ProjectDatabaseService {

    static loadProjectIdsFromLocalStorage() {
        return JSON.parse(localStorage.getItem('projects')) || [];
    }

    static loadProjectsFromAPI() {
        let projectIds = this.loadProjectIdsFromLocalStorage();
        let projectRequests = projectIds.map((id) =>
            fetch('http://zhaw-issue-tracker-api.herokuapp.com/api/projects/' + id)
        );

        return Promise.all(projectRequests)
            .then(responses => responses.map(data => data.json()));
    }

    static getProjects() {
        return this.loadProjectsFromAPI()
                    .then(json => Promise.all(json).then(data => data));
    }

    static saveProject(project) {
        return fetch("http://zhaw-issue-tracker-api.herokuapp.com/api/projects/", {
            method: "POST",
            body: JSON.stringify(this.cleanProjectObject(project)),
            headers: {
            "Content-Type": "application/json; charset=utf-8",
            }
        }).then(response =>
                response.json().then((json) => {
                    this.saveProjectIdToLocalStorage(json.id);
                    return json;
                })
        ).catch(err => console.log(err));
    }

    static saveProjectIdToLocalStorage(id) {
        let projectIds = this.loadProjectIdsFromLocalStorage();
        projectIds.push(id);
        localStorage.setItem('projects', JSON.stringify(projectIds));
    }

    static cleanProjectObject(project) {
        return Object.assign({}, {
            id: project.id,
            title: project.title,
            active: project.active,
            client_id: project.client_id,
            created_at: project.created_at,
            updated_at: project.updated_at
         });
     }
}
