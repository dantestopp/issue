<project-form>
        <form class="form" onsubmit="{this.onFormSubmit}">
            <div class="form-group">
                <label for="project-title">Title</label>
                <input ref="project-title" type="text" placeholder="New project" class="form-control">
            </div>
            <div class="form-group">
                <button class="btn btn-success"><i class="fas fa-plus"></i> New Project</button>
            </div>
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
