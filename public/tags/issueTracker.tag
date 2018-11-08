<issuetracker>
    <h1>Issue Tracker</h1>
    <project-list change-project="{changeProject}"></project-list>
    <project-form />
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

    addNewIssueToList(issue) {
        this.tags["issue-list"].issues.push(issue);
        this.tags["issue-list"].update();
    }


    </script>
</issuetracker>
