<projects>
    <section id="projects">
        <project onclick="{changeProject}" each="{projects}" data="{this}"></project>
        <input type="text" placeholder="New project">
        <input type="button" value="Save">
    </section>

    this.active = 1;

    changeProject(e) {
        this.active = e.item.id;
    }

    this.projects = [
        {id: 0, name: "test1"},
        {id: 1, name: "test2"}
    ]
</projects>
