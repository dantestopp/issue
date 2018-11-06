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

    static updateIssue(issue) {
        fetch("http://zhaw-issue-tracker-api.herokuapp.com/api/projects/" + issue.project_id + "/issues/" + issue.id, {
            method: "PUT",
            body: JSON.stringify(this.cleanIssueObject(issue)),
            headers: {
            "Content-Type": "application/json; charset=utf-8",
            }
        });
    }

    static cleanIssueObject(issue) {
        return Object.assign({}, {
            id: issue.id,
            project_id: issue.project_id,
            title: issue.title,
            done: issue.done,
            due_date: issue.due_date,
            priority: issue.priority,
            client_id: issue.client_id,
            project_client_id: issue.project_client_id,
            created_at: issue.created_at,
            updated_at: issue.updated_at
         });
    }
}
