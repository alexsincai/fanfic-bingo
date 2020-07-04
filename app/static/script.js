function deactivateCells() {
    // console.log(arguments.callee.name);
    document.querySelectorAll(".cell").forEach((cell) => {
        delete cell.dataset.id;
        delete cell.dataset.index;
        cell.removeEventListener("click", cellClicked, true);
    });
}

function deactivateButton() {
    // console.log(arguments.callee.name);
    const button = document.querySelector("button");
    button.removeEventListener("click", buttonClicked, false);
    button.classList.add("hidden");
}

function updateHistory(result) {
    // console.log(arguments.callee.name);
    window.history.pushState(result, "Fanfic Tropes Bingo", result.redirect);
}

async function buttonClicked(e) {
    // console.log(arguments.callee.name);
    e.preventDefault();
    const entries = [
        ...document.querySelectorAll(".cell.active[data-index]"),
    ].map((a) => parseInt(a.dataset.index, 10));
    const request = await fetch(window.location.href, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(entries),
    });

    if (!request.ok) {
        throw new Error("POST failed!");
    }

    const result = await request.json();

    if (result) {
        deactivateCells();
        deactivateButton();
        updateHistory(result);
    }
}

function flashBingo() {
    // console.log(arguments.callee.name);
    const header = document.querySelector("h3");
    const timer = setInterval(() => {
        header.classList.add("hidden");
    }, 3000);
    header.classList.remove("hidden");
}

function activateButton() {
    // console.log(arguments.callee.name);
    const button = document.querySelector("button");
    button.addEventListener("click", buttonClicked, false);
    button.classList.remove("hidden");
}

function checkBingo() {
    // console.log(arguments.callee.name);
    const checks = [
        [0, 1, 2, 3, 4],
        [5, 6, 7, 8, 9],
        [10, 11, 12, 13],
        [14, 15, 16, 17, 18],
        [19, 20, 21, 22, 23],
        [0, 5, 10, 14, 19],
        [1, 6, 11, 15, 20],
        [2, 7, 16, 21],
        [3, 8, 12, 17, 22],
        [4, 9, 13, 18, 23],
        [0, 6, 17, 23],
        [4, 8, 15, 19],
    ];
    const indices = [
        ...document.querySelectorAll(".cell.active[data-index]"),
    ].map((a) => parseInt(a.dataset.index, 10));

    return checks.some((c) => c.every((e) => indices.includes(e)));
}

function tryBingo() {
    if (checkBingo()) {
        // console.log(arguments.callee.name);
        flashBingo();
        activateButton();
    }
}

function cellClicked(e) {
    // console.log(arguments.callee.name);
    e.preventDefault();
    if (this.classList.contains("active")) {
        this.classList.remove("active");
    } else {
        this.classList.add("active");
        tryBingo();
    }
}

function activateCells() {
    // console.log(arguments.callee.name);
    document.querySelectorAll(".cell").forEach((cell, index) => {
        if (index !== 12) {
            cell.addEventListener("click", cellClicked, true);
        }
    });
}

activateCells();
