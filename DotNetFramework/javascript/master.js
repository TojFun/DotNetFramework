const checkbox = document.querySelector(".dark-mode-toggle");
const body = document.body;

const setAttr = () => {
    const isDark = localStorage.getItem("darkMode") == "true";

    body.setAttribute("color-scheme", isDark ? "dark" : "light");
    checkbox.checked = isDark;

};

if (localStorage.getItem("darkMode") == null) {
    localStorage.setItem(
        "darkMode",
        window.matchMedia &&
            window.matchMedia("(prefers-color-scheme: dark)").matches
            ? "true"
            : "false"
    );
}

setAttr();

const toggle = () => {
    localStorage.setItem(
        "darkMode",
        localStorage.getItem("darkMode") == "true" ? "false" : "true"
    );

    setAttr();
};

const logout = () => {
    if (confirm("Are you sure you want to logout?"))
        window.location.href = "/pages/Logout.aspx";
};
