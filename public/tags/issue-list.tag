<issue-list class="list-group">
    <h2 class="mt-3" >Issue List</h2>

    <loading if="{this.is_loading}" />
    
    <div  if="{!this.is_loading}" class="btn-group-vertical">
        <issue each="{issues}" data="{this}" />
    </div>
    <div if="{!this.is_loading && issues.length == 0}" class="list-group-item">
        <p>No issues in this project</p>
    </div>

    <script>
    this.issues = [];

    this.sortBy = 'due_date';

    this.changeProject = (projectId) => {
        this.is_loading = true;
        this.update();
        IssueDatabaseService.getIssuesFromProject(projectId)
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

    this.on('update', this.sortIssuesBy);
    </script>

</issue-list>
