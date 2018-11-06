<issue class="btn list-group-item list-group-item-action">
    <input type="checkbox" onchange="{updateDone}" checked="{this.done}">
    <p>{title} <span class="badge badge-primary">{this.priority}</span></p>

    <script>
        updateDone(e) {
            this.done = e.target.checked;
        }
    </script>

</issue>
