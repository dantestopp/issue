<project-form>
        <form class="form" onsubmit="{this.onFormSubmit}">
        <div class="row">
            <div class="col-sm-12">
                <div class="form-group">
                    <label for="project-title">Title</label>
                    <input ref="project-title" type="text" placeholder="New project" 
                        class="form-control { is-invalid: this.isInvalid }" onkeyup="{this.onKeyUp}">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="form-group">
                    <button class="btn btn-success"><i class="fas fa-plus"></i> New Project</button>
                </div>
            </div>
        </div>
        </form>

    <script>
    this.isInvalid = false;

    this.onKeyUp = (e) => {
        if (e.target.value != "") {
            this.isInvalid = false;
        }
    }

    this.onFormSubmit = (e) => {
        e.preventDefault();

        if (this.refs['project-title'].value == "") {
            this.isInvalid = true;
            return;
        }

        let project = {
            title: this.refs['project-title'].value,
            active: true
        };
        
        this.opts.addProject(project);
        this.refs['project-title'].value = '';
    }
    </script>

</project-form>
