<issuetracker>
    <project-list></project-list>
    <section id="project-new">
        <input type="text" placeholder="New project">
        <input type="button" value="Save">
    </section>
    <issue-list></issue-list>
    <section id="issue-new">
        <form onsubmit="{save}">
            <input type="text" onkeyup="{edit}" ref="input" placeholder="New Issue">
            <button disabled={!text}>Save</button>
        </form>
    </section>
    this.active;

    changeProject(e) {
        console.log(this.tags);
        this.tags["issue-list"].changeProject(e.item.id);
    }
</issuetracker>
