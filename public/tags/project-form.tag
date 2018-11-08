<project-form>
    <form onsubmit="{this.onFormSubmit}">
        <input ref="project-title" type="text" placeholder="New project">
        <button class="btn btn-success">Save</button>
    </form>

    <script>
    this.onFormSubmit = (e) => {
        e.preventDefault();

        let project = {
            client_id: "1",
            title: this.refs['project-title'].value,
            active: true
        };

        ProjectDatabaseService.saveProject(project)
            .then(data => this.opts.addProject(data))
            .then(() => {
                this.refs['project-title'].value = '';
            });


    }
    </script>

</project-form>
