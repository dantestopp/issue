<project-list class="list-group">
    <error if="{loading_failed}" message="Failed to load projects, check your internet connection" />
    <project onclick="{onProjectClicked}" each="{this.projects}" data="{this}" />
    <script>
        this.projects = [];

        ProjectDatabaseService.getProjects()
            .then((projects) => this.projects = projects)
            .catch((err) => {
                this.loading_failed = true;
            })
            .finally(this.update);

        this.onProjectClicked = (e) => {
            opts.changeProject(e);
        }
    </script>
</project-list>
