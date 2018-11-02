<issuetracker>
    <projects></projects>
    <issues></issues>

    this.on('mount', function() {
        this.tags.issues.switchProject(this.tags.projects.active).update();
        console.log(this.tags.issues.projectId);
    });
</issuetracker>
