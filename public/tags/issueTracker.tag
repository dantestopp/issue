<issuetracker>
    <h1>Issue Tracker</h1>
    <project-list change-project="{changeProject}"></project-list>
    <section id="project-new">
        <input type="text" placeholder="New project">
        <input type="button" value="Save">
    </section>
    <issue-list></issue-list>
    <section id="issue-new">
        <form onsubmit="{saveNewIssue}">
           <input type="text" onkeyup="{editNewIssue}" ref="input" placeholder="New Issue">
           <button disabled={!text}>Save</button>
        </form>
    </section>

    <script>

    this.activeProject = null;

    this.text = "";

    this.changeProject = (e) => {
        this.activeProject = e.item.id;
        this.tags["issue-list"].changeProject(e.item.id);
    }

    editNewIssue(e) {
        this.text = e.target.value;
    }

    saveNewIssue(e) {
        e.preventDefault();
        if (this.text) {
            let issue = {
                done: false,
                title: this.text,
                due_date: "2018-11-06",
                priority: "1",
                client_id: "1",
                project_client_id: "1"
            }

          IssueDatabaseService.saveIssue(this.activeProject, issue)
          this.tags["issue-list"].issues.push(issue);
          this.tags["issue-list"].update();
          this.text = this.refs.input.value = ''
        }
    }


    </script>
</issuetracker>
