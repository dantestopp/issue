<issue class="btn list-group-item list-group-item-action container">
    <div class="row">
        <div class="col col-sm-1">
            <input type="checkbox" onchange="{this.updateDone}" checked="{this.done}">
        </div>
        <div class="col col-sm-8">
            <p>{title} <span class="badge badge-primary">{this.priority}</span></p>
        </div>
        <div class="col col-sm-2">
            <p>{new Date(due_date).toDateString()}</p>
        </div>
        <div class="col col-sm-1">
            <button onclick="{this.deleteIssue}" class="btn btn-danger">
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
