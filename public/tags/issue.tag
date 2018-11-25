<issue class="btn list-group-item list-group-item-action container">
    <div class="form-inline">
        <div class="form-group col-sm-6">
            <label class="form-check-label">
                <input class="form-check-input" type="checkbox" onchange="{this.updateDone}" checked="{this.done}">
            {title} <span class="badge badge-primary ml-1">{this.priority}</span>
            </label>
        </div>

        <div class="form-group col-sm-4">
            <label>{new Date(due_date).toDateString()}</label>
        </div>
        <div class="form-group col-sm-2">
            <button onclick="{this.deleteIssue}" class="btn btn-danger ml-1">
                <i class="fas fa-trash"></i>
            </button>
        </div>  
    </div>

    <script>
        this.updateDone = (e) => {
            this.done = e.target.checked;
            IssueDatabaseService.updateIssue(this);
        }

        this.deleteIssue = () => {
            IssueDatabaseService.deleteIssue(this)
                .then(this.unmount);
        }



    </script>
</issue>
