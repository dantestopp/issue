<project-list class="list-group">
    <project onclick="{onProjectClicked}" each="{this.projects}" data="{this}" />
    <script>
        this.projects = [];
        ProjectDatabaseService.getProjects()
            .then((projects) => this.projects = projects)
            .then(this.update);

        this.onProjectClicked = (e) => {
            opts.changeProject(e);
        }
    </script>
</project-list>
