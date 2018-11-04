<issue class="{done: this.done}">
    <p>{name}</p>
    <input type="checkbox" onchange="{updateDone}" checked="{this.done}">

    updateDone(e) {
        this.done = e.target.checked;
    }

</issue>
