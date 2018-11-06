<issue-list>
    <issue each="{issues}" data="{this}"></issue>

    <script>
    this.issues = [];

    this.changeProject = (projectId) => {
        IssueDatabaseService.getIssuesFromProject(projectId)
            .then((issues) => this.issues = issues)
            .then(this.update);
    }
    </script>

</issue-list>
