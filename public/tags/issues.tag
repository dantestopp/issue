<issues>
    <h1>Issues</h1>
    <section id="issue-new">
        <form onsubmit="{save}">
            <input type="text" onkeyup="{edit}" ref="input" placeholder="New Issue">
            <button disabled={!text}>Save</button>
        </form>
    </section>
    <section id="issue-list">
        <issue each="{issues}" data="{this}"></issue>
    </section>

    this.issues = [];

    changeProject(projectId) {
        IssueDatabaseService.getIssuesFromProject(projectId)
            .then((issues) => this.issues = issues)
            .then(this.update);
    }


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
