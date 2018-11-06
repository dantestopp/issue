<issue-list>
    <issue each="{issues}" data="{this}"></issue>

    this.issues = [];

    changeProject(projectId) {
        IssueDatabaseService.getIssuesFromProject(projectId)
            .then((issues) => this.issues = issues)
            .then(this.update);
    }

</issue-list>
