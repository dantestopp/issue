class IssueDatabaseService {
    static loadIssuesFromAPI(projectId) {
        return fetch('http://zhaw-issue-tracker-api.herokuapp.com/api/projects/' + projectId + "/issues")
            .then(response => response.json());
    }

    static getIssuesFromProject(projectId) {
        return this.loadIssuesFromAPI(projectId).then(data => data);
    }

    static saveIssue(projectId, issue) {
        fetch("http://zhaw-issue-tracker-api.herokuapp.com/api/projects/" + projectId + "/issues", {
            method: "POST",
            body: JSON.stringify(issue),
            headers: {
            "Content-Type": "application/json; charset=utf-8",
            }
        });
    }

    static updateIssue(projectId, issueId, issue) {
        fetch("http://zhaw-issue-tracker-api.herokuapp.com/api/projects/" + projectId + "/issues/" + issueId, {
            method: "PUT",
            body: JSON.stringify(issue),
            headers: {
            "Content-Type": "application/json; charset=utf-8",
            }
        });
    }
}
