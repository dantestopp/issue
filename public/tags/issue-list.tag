<issue-list>
    <div class="row pr-3">
        <h2 class="mt-3 col-sm-6" >Issue List</h2>

        <select onchange="{this.changeSort}" id="sortIssueBy" ref="sort-issues-by" class="mt-3 mb-2 pl-3 form-control col-sm-6">
            <option value="due_date" selected>Due Date</option>
            <option value="title">Title</option>
            <option value="priority">Priority</option>
        </select>
    </div>

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

    this.changeSort = () => {
        this.sortBy = this.refs['sort-issues-by'].value;
        this.update();
    }

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
