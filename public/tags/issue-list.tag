<issue-list>
    <h2 class="mt-3" >Issue List</h2>

    <loading if="{this.is_loading}" />

    <div class="list-group-container"> 
        <div if="{!this.is_loading}" class="btn-group-vertical list-group">
            <issue each="{issues}" data="{this}" />
        </div>
        <div if="{!this.is_loading && issues.length == 0 && this.activeProjectClientId != null}" class="list-group-item">
            <p>No issues in this project</p>
        </div>
        <div if="{!this.is_loading && this.activeProjectClientId == null}" class="list-group-item">
            <p>No project selected</p>
        </div>
    </div>

    <script>
    this.issues = [];
    this.activeProjectClientId = null;
    this.sortBy = 'due_date';

    this.changeProject = (projectClientId) => {
        this.activeProjectClientId = projectClientId;
        this.is_loading = true;
        this.update();
        IssueDatabaseService.getIssuesFromProject(projectClientId)
            .then((issues) => this.issues = issues)
            .then(() => {
                this.is_loading = false;
                this.update();
            });
    };

    this.sortIssuesBy = () => {
        this.issues.sort((a, b) => {
            if (a[this.sortBy] > b[this.sortBy]) {
                return 1;
            } else if (a[this.sortBy] == b[this.sortBy]) {
                return 0;
            } else {
                return -1;
            }
        });
    };

    this.addNewIssue = (issue) => {
        IssueDatabaseService.saveIssue(issue);
        this.issues.push(issue);
        this.update();
    };

    this.on('update', this.sortIssuesBy);
    </script>

</issue-list>
