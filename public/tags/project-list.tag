<project-list>
    <h2 class="mt-3" >Project List</h2>

    <error if="{loading_failed}" message="Failed to load projects, check your internet connection" />
    <loading if="{is_loading}"/>
    <div class="list-group-container"> 
        <div class="btn-group-vertical list-group">
            <project onclick="{onProjectClicked}" each="{this.projects}" data="{this}" is-selected="{this.selectedProjectId == id}" />
        </div>
    </div>
    <script>
        this.projects = [];
        this.selectedProjectId = null;

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
            this.selectedProjectId = e.item.id;
            this.update();
            opts.changeProject(e);
        }
    </script>
</project-list>
