<issuetracker class="container">
    <h1>Issue Tracker</h1>
    <project-list change-project="{changeProject}"></project-list>
    <section id="project-new">
        <input type="text" placeholder="New project">
        <input type="button" value="Save">
    </section>
    <issue-list></issue-list>
    <section id="issue-new">
        <form>
            <input type="text" ref="input" placeholder="New Issue">
            <button>Save</button>
        </form>
    </section>

    <script>
    this.changeProject = (e) => {
        this.tags["issue-list"].changeProject(e.item.id);
    }
    </script>
</issuetracker>
