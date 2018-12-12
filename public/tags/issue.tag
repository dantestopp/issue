<issue class="btn list-group-item list-group-item-action container">
    <div class="form-inline">
        <div class="form-group col-sm-6">
            <input class="form-check-input pull-left" type="checkbox" onchange="{this.updateDone}" checked="{this.done}">
            <label class="form-check-label text-truncate pull-left">
                {title} 
            </label>
            <span class="badge badge-primary ml-1">{this.priority}</span>
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
