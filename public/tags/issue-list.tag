<issue-list class="list-group">
    <loading if="{this.is_loading}" />
    <issue each="{issues}" data="{this}" />
    <div if="{issues.length == 0}" class="list-group-item">
        <p>No issues in this project</p>
    </div>

    <script>
    this.issues = [];
    this.changeProject = (projectId) => {
        this.is_loading = true;
        this.update();
        IssueDatabaseService.getIssuesFromProject(projectId)
            .then((issues) => this.issues = issues)
            .then(() => {
                this.is_loading = false;
                this.update();
            });
    }
    </script>

</issue-list>
