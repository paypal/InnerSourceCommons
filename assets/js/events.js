/*!
 * JavaScript functions for use in event pages. 
 */

/*
 * toggleAbstract toggles the visibility of the abstract of a presentation on
 * agenda pages of InnerSource events.
 */
function toggleAbstract(elementId) {
    var a = document.getElementById(elementId);
    var aLink = document.getElementById(elementId + "-link");
    if (a.style.display == "none") {
        a.style.display = "block";
        aLink.text = "Hide Abstract";
    } else {
        a.style.display = "none";
        aLink.text = "Show Abstract";
    }
}
