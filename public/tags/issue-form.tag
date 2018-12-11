<issue-form>
    <form onsubmit="{this.onFormSubmit}" class="form">
        <div class="row">
            <div class="col-sm-5">
                <div class="form-group">
                    <label for="issue-title">Title</label>
                    <input ref="issue-title"
                            type="text" class="form-control { is-invalid: this.isInvalidTitle }" 
                            onkeyup="{this.onKeyUpTitle}"
                            id="issue-title" placeholder="A new issue" />
                </div>
            </div>

            <div class="col-sm-5">
                <div class="form-group">
                    <label for="issue-date">Start date</label>
                    <input type="date"
                            class="form-control { is-invalid: this.isInvalidDate }"
                            ref="issue-date"
                            min="{this.getToday()}"
                            onchange="{this.onchangeDate}"
                            id="issue-date"
                            value="{this.getToday()}">
                </div>
            </div>

            <div class="col-sm-2">
                <div class="form-group">
                    <label for="issue-priority">Priority</label>
                    <select ref="issue-priority" id="issue-priority" class="form-control">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    </select>
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="col-sm-5">
                <div class="form-group">
                    <button type="submit" class="btn btn-success">
                        <i class="fas fa-plus"></i> New Issue
                    </button>
                </div>
            </div>
        </div>
    </form>

    <script>
        this.activeProject = null;
        this.isInvalidTitle = false;
        this.isInvalidDate = false;

        this.onKeyUpTitle = (e) => {
            if (e.target.value != "") {
                this.isInvalidTitle = false;
            }
        }        

        this.onchangeDate = (e) => {
            if (e.target.value != "") {
                this.isInvalidDate = false;
                return;
            }
        }

        this.onFormSubmit = (e) => {
            e.preventDefault();

            console.log(this.refs['issue-date'].value);

            if (this.refs['issue-title'].value == "") {
                this.isInvalidTitle = true;
                return;
            }

            if (this.refs['issue-date'].value == "") {
                this.isInvalidDate = true;
                return;
            }

            let issue = {
                done: false,
                title: this.refs['issue-title'].value,
                due_date: this.refs['issue-date'].value,
                priority: this.refs['issue-priority'].value,
                client_id: "1",
                project_client_id: "1"
            };

            this.refs['issue-title'].value = '';
            this.refs['issue-priority'].value = 1;
            this.refs['issue-date'].value = this.getToday();

            IssueDatabaseService.saveIssue(this.activeProject, issue);
            this.opts.addIssue(issue);
        }

        this.getToday = () => {
            return new Date().toISOString().substr(0, 10);;
        }
    </script>
</issue-form>
