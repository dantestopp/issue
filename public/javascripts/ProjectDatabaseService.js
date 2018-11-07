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

    }

    static saveProjectIdToLocalStorage(id) {
        let projectIds = this.loadProjectIdsFromLocalStorage();
        projectIds.push(id);
        localStorage.setItem('projects', JSON.stringify(projectIds));
    }
}
