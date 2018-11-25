<project-list class="list-group">
    <h2 class="mt-3" >Project List</h2>

    <error if="{loading_failed}" message="Failed to load projects, check your internet connection" />
    <loading if="{is_loading}"/>
    <div class="btn-group-vertical">
        <project onclick="{onProjectClicked}" each="{this.projects}" data="{this}" />
    </div>
    <script>
        this.projects = [];

        this.is_loading = true;

        ProjectDatabaseService.getProjects()
            .then((projects) => this.projects = projects)
            .catch((err) => {
                this.loading_failed = true;
            })
            .finally(() => {
                this.is_loading = false;
                this.update();
            });

        this.onProjectClicked = (e) => {
            opts.changeProject(e);
        }
    </script>
</project-list>
