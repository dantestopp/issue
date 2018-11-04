<projects>
    <section id="project-list">
        <project onclick="{changeProject}" each="{projects}" data="{this}"></project>
    </section>
    <section id="project-new">
        <input type="text" placeholder="New project">
        <input type="button" value="Save">
    </section>

    this.active = 1;

    changeProject(e) {
        this.active = e.item.id;
    }

    this.projects = [
        {id: 0, name: "test1"},
        {id: 1, name: "test2"},
        {id: 2, name: "test2"},
        {id: 3, name: "test2"},
        {id: 4, name: "test2"},
        {id: 5, name: "test2"},
        {id: 6, name: "test2"},
    ]
</projects>
