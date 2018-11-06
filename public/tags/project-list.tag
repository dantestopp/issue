<project-list>
    <project onclick="{parent.parent.changeProject}" each="{this.projects}" data="{this}"></project>

    this.projects = [];

    ProjectDatabaseService.getProjects()
        .then((projects) => this.projects = projects)
        .then(this.update);

</project-list>
