<issuetracker>
    <project-list></project-list>
    <section id="project-new">
        <input type="text" placeholder="New project">
        <input type="button" value="Save">
    </section>
    <issues></issues>

    this.active;

    changeProject(e) {
        this.tags.issues.changeProject(e.item.id);
    }
</issuetracker>
