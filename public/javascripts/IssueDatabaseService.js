class IssueDatabaseService {
    static loadIssuesFromAPI(projectId) {
        return fetch('http://zhaw-issue-tracker-api.herokuapp.com/api/projects/' + projectId + "/issues")
            .then(response => response.json());
    }

    static getIssuesFromProject(projectId) {
        return this.loadIssuesFromAPI(projectId).then(data => data);
    }
}
