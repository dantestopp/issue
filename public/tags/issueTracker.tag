<issuetracker>
    <h1><i class="fas fa-calendar-check"></i> Issue Tracker</h1>
    <project-list change-project="{this.changeProject}"></project-list>
    <project-form add-project="{this.addNewProjectToList}"/>
    <issue-form add-issue="{this.addNewIssueToList}"/>
    <issue-list />

    <script>

    this.activeProject = null;

    this.text = "";

    this.changeProject = (e) => {
        this.activeProject = e.item.id;
        this.tags["issue-list"].changeProject(e.item.id);
        this.tags["issue-form"].activeProject = e.item.id;
    }

    this.addNewIssueToList = (issue) => {
        this.tags["issue-list"].issues.push(issue);
        this.tags["issue-list"].update();
    }

    this.addNewProjectToList = (project) => {
        this.tags["project-list"].projects.push(project);
        this.tags["project-list"].update();
    }


    </script>
</issuetracker>
