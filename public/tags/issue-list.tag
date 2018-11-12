<issue-list class="list-group">
    <loading if="{this.is_loading}" />
    <issue each="{issues}" data="{this}" />

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
