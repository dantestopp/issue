<issue-form>
    <form onsubmit="{this.onFormSubmit}" class="form-inline">
        <label for="issue-priority">Priority</label>
        <select ref="issue-priority" id="issue-priority" class="form-control">
          <option>1</option>
          <option>2</option>
          <option>3</option>
        </select>
        <div class="form-group">
            <label for="issue-title">Title</label>
            <input ref="issue-title"
                    type="text" class="form-control"
                    id="issue-title" placeholder="A new issue" />
        </div>
        <button type="submit" class="btn btn-success mb-2">Submit</button>
    </form>

    <script>
        this.activeProject = null;

        this.onFormSubmit = (e) => {
            e.preventDefault();

            let issue = {
                done: false,
                title: this.refs['issue-title'].value,
                due_date: "2018-11-06",
                priority: this.refs['issue-priority'].value,
                client_id: "1",
                project_client_id: "1"
            };

            this.refs['issue-title'].value = '';
            this.refs['issue-priority'].value = 1;

            IssueDatabaseService.saveIssue(this.activeProject, issue);
            this.opts.addIssue(issue);
        }
    </script>
</issue-form>
