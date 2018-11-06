<issue class="{done: this.done}">
    <p>{title}</p>
    <input type="checkbox" onchange="{updateDone}" checked="{this.done}">

    updateDone(e) {
        this.done = e.target.checked;
    }

</issue>
