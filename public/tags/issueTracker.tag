<issuetracker>
    <div class="row">
        <div class="col-sm-12">
            <h1><i class="fas fa-calendar-check"></i> Issue Tracker</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <project-form add-project="{this.addNewProjectToList}"/>
            <project-list change-project="{this.changeProject}"></project-list>
        </div>
        <div class="col-md-6">
            <issue-form add-issue="{this.addNewIssueToList}"/>
            <issue-list />
        </div>
    </div>

    <script>

    this.activeProject = null;

    this.text = "";

    this.changeProject = (e) => {
        this.activeProject = e.item.client_id;
        this.tags["issue-form"].changeProject(e.item.client_id);
        this.tags["issue-list"].changeProject(e.item.client_id);
    }

    this.addNewIssueToList = (issue) => {
        this.tags["issue-list"].addNewIssue(issue);
    }

    this.addNewProjectToList = (project) => {
        this.tags["project-list"].addNewProject(project);
    }
    </script>
</issuetracker>
