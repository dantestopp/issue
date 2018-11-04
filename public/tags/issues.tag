<issues>
    <h1>Issues</h1>
    <section id="issue-new">
        <form onsubmit="{save}">
            <input type="text" onkeyup="{edit}" ref="input" placeholder="New Issue">
            <button disabled={!text}>Save</button>
        </form>
    </section>
    <section id="issue-list">
        <issue each="{issues[this.projectId]}" data="{this}"></issue>
    </section>

    switchProject(projectId) {
        this.projectId = projectId;
        return this;
    }

    this.issues = [
        [
            {name: "test"},
            {name: "tes2t"}
        ],
        [
            {name:"project2s"},
            {name:"projects2222", done: true}
        ]
    ]

    edit(e) {
        this.text = e.target.value;
    }

    save(e) {
        e.preventDefault();
        console.log(this);
        if (this.text) {
          this.issues[this.projectId].push({ name: this.text})
          this.text = this.refs.input.value = ''
        }
    }


</issues>
